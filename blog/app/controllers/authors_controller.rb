class AuthorsController < ApplicationController
  before_action :set_author, only: %i(show edit update)

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:success] = 'New author created!'
      redirect_to @author
    else
      flash[:error] = 'Failed to create author'
      render :new
    end
  end

  def update
    if @author.update(author_params)
      flash[:success] = 'Author updated'
      redirect_to @author
    else
      flash[:error] = 'Failed to update author'
      render :edit
    end
  end

  private

  def author_params
    params.require(:author).permit(:full_name, :dob)
  end

  def set_author
    @author = Author.find(params[:id])
  end
end
