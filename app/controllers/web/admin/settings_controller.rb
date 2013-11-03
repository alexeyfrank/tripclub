class Web::Admin::SettingsController < Web::Admin::ApplicationController
  before_filter :authenticate_user!

  def update
    @object = ::ActiveadminSettings::Setting.find(params[:id])
    if @object.update_attributes(setting_params)
      render :text => @object.value
    else
      render :text => "error"
    end
  end

  private
    def setting_params
      params.require(:setting).permit!
    end
end

