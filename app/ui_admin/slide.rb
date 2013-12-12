ActiveAdmin.register ::Slide do
  menu label: proc { I18n.t 'admin.menu.slides' }
  index do
    column :title
    column :created_at
    default_actions
  end

  filter :title
  filter :created_at

  form html: { multipart: true } do |f|
    f.inputs "Slide Details" do
      f.input :title
      f.input :image, as: :file
    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit slide: [:title, :image]
    end
  end

end
