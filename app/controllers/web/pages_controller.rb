# encoding: utf-8
class Web::PagesController < Web::ApplicationController

  layout 'web/pages'

  def show
    @page = Page.find_by! slug: params[:id]
    @content = liquid(@page.content)
  end

  private
    def title
      @page.title
    end

end
