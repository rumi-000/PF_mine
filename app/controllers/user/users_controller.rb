class User::UsersController < ApplicationController
 before_action :authenticate_user!, except: [:show]
 
   # is_deletedがfalseならtrueを返すようにしている
 def active_for_authentication?
  super && (is_deleted == false)
 end
 
 def show
  @user = User.find(current_user.id)
  #@user = User.find(params[:id])
  @post = @user.posts.all.page(params[:page])
 end
 
 def edit
  @user = User.find(current_user.id)
 end
 
 def update
  @user = User.find(current_user.id)
   if @user.update(user_params)
    redirect_to user_path(current_user.id)
   else
    render :edit
   end
 end

 #ユーザーの退会機能 
 
  #退会ページの表示
 def confirm_withdraw
  @user = User.find(current_user.id)
 end
  
  #退会機能のアクション
 def withdraw
   @user = User.find(current_user.id)
   if @user.update(is_deleted: true)
   reset_session
   flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
   else
   @user = User.find(params[:id])
    render :show
   end
 end
 #ユーザーの退会機能ここまで
 
private

def user_params
 params.require(:user).permit(:introduction)
end

end
