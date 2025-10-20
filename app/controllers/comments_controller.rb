class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post), notice: 'コメントを投稿しました'
    else
      redirect_to post_path(@post), alert: 'コメントの投稿に失敗しました'
    end
  end
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.user == current_user
        @comment.destroy
        redirect_to post_path(@post), notice: 'コメントを削除しました'
    else
        redirect_to post_path(@post), alert: '自分のコメントのみ削除できます'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end