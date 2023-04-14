class User::UsersController < ApplicationController
 before_action :authenticate_user!
  
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

private

def user_params
 params.require(:user).permit(:introduction)
end

end