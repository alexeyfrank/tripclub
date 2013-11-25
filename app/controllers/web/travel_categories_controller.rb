# encoding: utf-8
class Web::TravelCategoriesController < Web::ApplicationController

  def show
    @category = TravelCategory.find params[:id]
    @categories = TravelCategory.all
  end

  def title
    "Идеи для путешествий"
  end
end
