class ApplicationController < ActionController::Base
  before_action :set_current_user
  protect_from_forgery with: :exception
  include SessionsHelper

  #現ユーザー名の取得
  def set_current_user
   @current_user = User.find_by(id: session[:user_id])
  end

  # ログインしていないユーザーを弾くメソッド
  def autenticate_user
    if @current_user == nil
      redirect_to new_session_path, notice: 'ログインしてください'
    end
  end

end
