class Web::TravelIdeasController < Web::ApplicationController
  def show
    @categories = TravelCategory.all
    @idea = TravelIdea.find params[:id]
  end
end
