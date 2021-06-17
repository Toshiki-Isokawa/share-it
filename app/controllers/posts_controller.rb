class PostsController < ApplicationController
  before_action :require_user_logged_in
  
  def show 
    @post = Post.find(params[:id])
  end
  
  def new 
    @post = current_user.posts.new
  end
  
  def create
    @post = current_user.posts.new(post_params)
    
    if @post.save 
      flash[:success] = 'Blogを投稿しました。'
      redirect_to user_path(current_user.id)
    else
      flash[:danger] = 'Blogの投稿に失敗しました。'
      render 'new'
    end
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    @post.destroy
    flash[:success] = 'Blogを削除しました。'
    redirect_to user_path(current_user.id)
  end
  
  private 
  
  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
