ActiveAdmin.register ::Post do
  menu label: proc { I18n.t 'admin.menu.posts' }
  index do
    column :preview do |post|
      link_to image_tag(post.preview_url), admin_post_path(post)
    end
    column :title
    column :created_at
    default_actions
  end

  filter :title
  filter :created_at

  form html: { multipart: true } do |f|
    f.inputs "Post Details" do
      f.input :title
      f.input :preview, as: :file
      f.input :introtext
      f.input :content, :as => :rich, :config => { :width => '76%', 'margin-left' => '24%', :height => '400px' }
    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit post: [:title, :introtext, :content, :preview]
    end
  end

end
