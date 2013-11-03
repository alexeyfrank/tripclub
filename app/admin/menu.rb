ActiveAdmin.register Menu do
  menu label: proc { I18n.t('admin.menu.menus') }

  index do
    column :title
    column :slug
    default_actions
  end

  filter :title
  filter :slug

  form do |f|
    f.inputs "Menu Details" do
      f.input :title
      f.input :slug
    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit menu: [:title, :slug]
    end

    def current_nav_menu
      Menu.find(params[:id])
    end
  end

  sidebar "Menu Details", only: [:show, :edit] do
    ul do
      li link_to(I18n.t('admin.menu.menu_items'), admin_menu_items_path(resource))
    end
  end

end

