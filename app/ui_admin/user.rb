ActiveAdmin.register ::User do
  menu label: proc { I18n.t 'admin.menu.users' }
  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit user: [:email, :password, :password_confirmation]
    end
  end
end
