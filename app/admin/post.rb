ActiveAdmin.register Post do
  menu label: proc { I18n.t 'admin.menu.posts' }
  index do
    column :title
    column :created_at
    default_actions
  end

  filter :title
  filter :created_at

  form do |f|
    f.inputs "Page Details" do
      f.input :title
      f.input :introtext
      f.input :content
    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit post: [:title, :introtext, :content]
    end
  end

end
