class Web::Houses::ApplicationController < Web::ApplicationController
  def resource_house
    House.find params[:house_id]
  end

  helper_method :resource_house
end
