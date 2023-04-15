# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
 before_action :user_state, only: [:create]
 
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

protected

# 退会しているかを判断するメソッド
def user_state
 @user = User.find_by(email: params[:user][:email])
  if @user
   if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == true )
    flash[:danger] = 'お客様は退会済みです。申し訳ございませんが、別のメールアドレスをお使いください。'
   redirect_to new_customer_session_path
   end
  end
end

end
