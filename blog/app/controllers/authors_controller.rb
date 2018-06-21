class AuthorsController < ApplicationController
  def index
  	@authors = Author.all
  end

  def show
  	@author = Author.find(params[:id])
  end

  def new
  end

  def destroy
  	@author = Author.find(params[:id])
  	@author.destroy

  	flash.notice="Author #{@author.firstname} #{@author.lastname} was deleted."

  	redirect_to authors_path
  end

  def edit
  	@author = Author.find(params[:id])
  end

  def update
  	@author = Author.find(params[:id])
  	respond_to do |format|
  		format.html do
  			if @author.update(authors_params)
  				redirect_to authors_path
  			end
  			
  		end
	end
  end

  def create
  	@author = Author.new(authors_params)
  	@author.save
  	redirect_to @author
  end

  private
  	def authors_params
  		params.require(:author).permit(:lastname, :firstname, :dob)
  	end



end
