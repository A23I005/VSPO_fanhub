class LikesController < ApplicationController
    before_action :authenticate_user!
  before_action :set_post

  def create
    @post.likes.find_or_create_by(user: current_user)
    redirect_to @post
  end

  def destroy
    @post.likes.where(user: current_user).destroy_all
    redirect_to @post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

end
