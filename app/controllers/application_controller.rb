class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #ログイン済みのユーザーのみアクセス
  before_action :authenticate_user!
  #diviseコントローラーにストロングパラメーターを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    words_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    new_user_session_path # ログアウト後に遷移するpathを設定
  end

  protected
  def configure_permitted_parameters
    #サインアップ時にnameストロングパラメータを取得
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #アカウント編集時にname,profileのストロングパラメーターを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
  end
end
