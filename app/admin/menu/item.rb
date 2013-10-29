ActiveAdmin.register Menu::Item, as: 'Item' do
  belongs_to :menu

  index do
    column :title
    column :url
    column :parent
    column :position
    default_actions
  end

  filter :title
  filter :url
  filter :parent
  filter :position

  form do |f|
    f.inputs "Menu Item Details" do
      f.input :title
      f.input :url
      f.input :position
      f.input :parent_id, as: :select, collection: Menu.find(params[:menu_id]).items

    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit item: [:title, :url, :position, :parent_id]
    end
  end

end


