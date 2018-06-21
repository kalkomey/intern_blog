class PostsController < ApplicationController

  before_action :set_post, only: %i(show edit update)

  def index
    @posts = Post.limit(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'Post created'
      redirect_to post_path(@post)
    else
      flash[:error] = 'Failed to create post'
      render :new
    end
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post updated'
      redirect_to post_path(@post)
    else
      flash[:error] = 'Could not update post'
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :author_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
