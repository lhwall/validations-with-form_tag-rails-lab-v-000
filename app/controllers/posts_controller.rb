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
  if Post.new(params.require(:post).permit(:title, :content, :category)).valid?
    @post.update(params)
    @post.save
    redirect_to post_path(@post)
  else 
    render :edit
  end 
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
