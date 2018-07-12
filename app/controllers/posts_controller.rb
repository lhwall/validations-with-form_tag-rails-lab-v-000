class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    #binding.pry
    @post = Post.find(params[:id])
  end

  def update
    #binding.pry
  @post = Post.find(params[:id])
  @post.update(post_params)
  #binding.pry
  if @post.valid?
    redirect_to post_path(@post)
  else
    #binding.pry
    render :edit
  end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
