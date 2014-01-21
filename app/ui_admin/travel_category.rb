ActiveAdmin.register ::TravelCategory do
  menu label: proc { I18n.t 'admin.menu.travel_categories' }, parent: 'TravelIdea'
  index do
    column :title
    column :created_at
    default_actions
  end

  filter :title
  filter :created_at

  form html: { multipart: true } do |f|
    f.inputs "TravelCategory Details" do
      f.input :title
      f.input :content, :as => :rich, :config => { :width => '76%', 'margin-left' => '24%', :height => '400px' }
    end
    f.inputs "Images" do
      f.has_many :images, allow_destroy: true, new_record: true do |cf|
        cf.input :title
        cf.input :file
      end
    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit travel_category: [:title, :content, :images_attributes => [:title, :file, "_destroy", :id]]
    end
  end

end
