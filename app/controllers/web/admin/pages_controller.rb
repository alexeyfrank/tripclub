class Web::Admin::PagesController < Web::Admin::ApplicationController

  def index
    @items = Page.admin
  end

  def new
    @item = Page.new
  end

  def create
    @item = Page.new params[:page]
    if @item.save
      f :success
      redirect_to edit_admin_page_path(@item)
    else
      f :error
      render :new
    end
  end

  def edit
    @item = Page.find params[:id]
  end

  def update
    @item = Page.find params[:id]
    if @item.update_attributes params[:page]
      f :success
      redirect_to edit_admin_page_path(@item)
    else
      f :error
      render :edit
    end
  end

  def destroy
    @item = Page.find params[:id]
    @item.destroy
    f :success
    redirect_to admin_pages_path
  end
end
