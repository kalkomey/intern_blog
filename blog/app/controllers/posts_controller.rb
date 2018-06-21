class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy

  	#flash.notice="Post by #{@author.firstname} #{@author.lastname} was deleted."

  	redirect_to posts_path
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	respond_to do |format|
  		format.html do
  			if @post.update(posts_params)
  				redirect_to posts_path
  			end
  			
  		end
	  end
  end

  def create
  	@post = Post.new(posts_params)
  	@post.save
  	redirect_to @post
  end

  private
  	def posts_params
  		params.require(:post).permit(:title, :body, :author_id)
  	end

end
