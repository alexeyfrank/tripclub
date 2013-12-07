ActiveAdmin.register ::House do
  menu label: proc { I18n.t 'admin.menu.houses' }
  index do
    column :preview do |house|
      img = house.images.first
      if img
        link_to image_tag(img.file_url), admin_house_path(house)
      end
    end
    column :address
    column :created_at
    default_actions
  end

  filter :address
  filter :created_at

  form html: { multipart: true } do |f|
    f.inputs "House Details" do
      f.input :address
      f.input :description, :as => :rich, :config => { :width => '76%', 'margin-left' => '24%', :height => '400px' }
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
      params.permit house: [ :address, :description, :images_attributes => [:title, :file, "_destroy", :id] ]
    end
  end

  sidebar "House Details", only: [:show, :edit] do
    ul do
      li link_to(I18n.t('admin.house.house_bookings'), admin_house_bookings_path(resource))
    end
  end
end
