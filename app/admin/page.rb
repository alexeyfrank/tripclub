ActiveAdmin.register Page do
  menu label: proc { I18n.t 'admin.menu.pages' }
  index do
    column :title
    column :created_at
    column :parent
    default_actions
  end

  filter :title
  filter :created_at

  form do |f|
    f.inputs "Page Details" do
      f.input :title
      f.input :content
      f.input :parent_id, as: :select, collection: Page.all
    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit page: [:title, :content, :parent_id]
    end
  end

end
