ActiveAdmin.register ::House::Booking, as: 'Booking' do
  belongs_to :house

  index do
    column :email
    column :phone
    column :from
    column :to
    default_actions
  end

  filter :email
  filter :phone
  filter :from
  filter :to

  # form do |f|
  #   f.inputs "Menu Item Details" do
  #     f.input :title
  #     f.input :url
  #     f.input :position

  #   end
  #   f.actions
  # end

  # controller do
  #   def permitted_params
  #     params.permit item: [:title, :url, :position, :parent_id]
  #   end
  # end

end


