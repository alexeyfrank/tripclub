ActiveAdmin.register ::TravelIdea do
  menu label: proc { I18n.t 'admin.menu.travel_ideas' }, parent: 'TravelIdea'
  index do
    column :title
    column :travel_category
    column :created_at
    default_actions
  end

  filter :title
  filter :travel_category_id
  filter :created_at

  form html: { multipart: true } do |f|
    f.inputs "Post Details" do
      f.input :title
      f.input :preview_img
      f.input :travel_category_id, as: :select, collection: ::TravelCategory.all
      f.input :introtext
      f.input :content, :as => :rich, :config => { :width => '76%', 'margin-left' => '24%', :height => '400px' }
    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit travel_idea: [:title, :content, :travel_category_id, :preview_img, :introtext]
    end
  end

end
