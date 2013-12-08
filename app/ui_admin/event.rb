ActiveAdmin.register ::Event do
  menu label: proc { I18n.t 'admin.menu.events' }
  index do
    column :title
    column :date
    column :created_at
    default_actions
  end

  filter :title
  filter :date
  filter :created_at

  form do |f|
    f.inputs "Event Details" do
      f.input :title
      f.input :description, :as => :rich, :config => { :width => '76%', 'margin-left' => '24%', :height => '400px' }
      f.input :date
    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit event: [:title, :description, :date]
    end
  end

end
