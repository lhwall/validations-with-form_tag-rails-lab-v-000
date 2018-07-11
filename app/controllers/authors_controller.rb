class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    if Author.new(author_params).valid?
    @author = Author.create(author_params)

    redirect_to author_path(@author)
  else
    render :new
  end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if Author.new(author_params).valid?
      @author.update(author_params)
      @author.save
      redirect_to author_path(@author)
    else
      render :edit
    end
  end


  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
