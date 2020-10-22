class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path, notice: "投稿されました！"
      else
        render :new
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_path, notice: '編集は正常に行われました' }
        format.json { render :index, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: '投稿を削除しました' }
      format.json { head :no_content }
    end
  end

  def confirm
    @post = Post.new(post_params)
    if current_user
      @post.user_id = current_user.id
      render :new if @post.invalid?
    else
      redirect_to new_session_path, notice: 'ログインしてください'
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :image, :image_cache)
  end
end
