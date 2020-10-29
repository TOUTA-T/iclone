class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :autenticate_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    # ユーザーページでお気に入り一覧を表示させる
    @posts = @user.posts
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id) # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    @favorite_list = Post.find(favorites)     # postsテーブルから、お気に入り登録済みのレコードを取得
  end

  def edit
    if @current_user.id !=  params[:id].to_i
      redirect_to new_session_path, notice: '編集権限がありません'
    end
  end

  def update
    if @user.update(user_params)
    flash[:success] = 'ユーザー情報を編集しました。'
    render :show
    else
    flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
    render :show
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
  params.require(:user).permit(:name, :email, :password,:password_confirmation, :image, :image_cache, :introduction)
  end
end
