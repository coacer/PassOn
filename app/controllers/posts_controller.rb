class PostsController < ApplicationController

before_action :authenticate_user!

  def index
    @posts = Post.all.order(created_at: 'desc')
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = '投稿しました！'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comments = @post.post_comments
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = '編集しました！'
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = '削除しました！'
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :image, :user_id)
    end
end
