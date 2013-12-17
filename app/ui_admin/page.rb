ActiveAdmin.register ::Page do
  menu label: proc { I18n.t 'admin.menu.pages' }
  index do
    column :title
    column :slug
    column :created_at
    column :parent
    actions
  end

  filter :title
  filter :created_at

  form do |f|
    f.inputs "Page Details" do
      f.input :title
      f.input :slug
      f.input :content, :as => :rich, :config => { :width => '76%', 'margin-left' => '24%', :height => '400px' }
      f.input :parent_id, as: :select, collection: ::Page.all
    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit page: [:title, :slug, :content, :parent_id]
    end
  end

end
