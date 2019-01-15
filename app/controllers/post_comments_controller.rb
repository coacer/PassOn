class PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = @post.id
    comment.save
    flash[:notice] = 'コメントを投稿しました！'
    redirect_to post_path(@post)
  end

 def destroy
   @post_comment = PostComment.find(params[:id])
   @post_comment.destroy
   flash[:notice] = 'コメントを削除しました！'
   redirect_to posts_path
 end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :user_id, :post_id)
  end

end
