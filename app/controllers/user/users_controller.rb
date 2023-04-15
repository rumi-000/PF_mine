class User::UsersController < ApplicationController
 before_action :authenticate_user!
   # is_deletedがfalseならtrueを返すようにしている
   
 def active_for_authentication?
  super && (is_deleted == false)
 end
 
 
def show
 @user = User.find(params[:id])
 @post = @user.posts.all
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
 def unsubscribe
  @user = User.find(current_user.id)
 end
  
 def destroy
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
  
private

def user_params
 params.require(:user).permit(:introduction)
end

end
