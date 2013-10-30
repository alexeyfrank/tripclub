# encoding: utf-8
class Web::PostsController < Web::ApplicationController
  layout 'web/blog'

  def index
    @posts = Post.desc.page(params[:page])
  end

  def show
    @post = Post.find params[:id]
  end

  def title
    if @post
      @post.title
    else
      'Блог'
    end
  end
end
