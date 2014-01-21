class Web::TravelIdeasController < Web::ApplicationController
  def show
    @categories = TravelCategory.all
    @idea = TravelIdea.find params[:id]
  end

  def title
    @idea.title
  end
end
