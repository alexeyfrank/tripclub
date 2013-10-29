class Web::PostsController < Web::ApplicationController
  layout 'web/blog'

  def index
    @posts = Post.desc.page(params[:page])
  end

  def show
    @post = Post.find params[:id]
  end
end
