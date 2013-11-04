# encoding: utf-8
class Web::HousesController < Web::ApplicationController
  layout 'web/houses'

  def index
    @houses = House.web
  end

  def show
    @house = House.find params[:id]
  end

  private 
  def title
    'Аренда квартир'
  end
end
