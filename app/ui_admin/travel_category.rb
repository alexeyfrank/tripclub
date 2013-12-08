ActiveAdmin.register ::TravelCategory do
  menu label: proc { I18n.t 'admin.menu.travel_categories' }
  index do
    column :title
    column :created_at
    default_actions
  end

  filter :title
  filter :created_at

  form html: { multipart: true } do |f|
    f.inputs "Post Details" do
      f.input :title
      f.input :content, :as => :rich, :config => { :width => '76%', 'margin-left' => '24%', :height => '400px' }
    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit travel_category: [:title, :content]
    end
  end

end
