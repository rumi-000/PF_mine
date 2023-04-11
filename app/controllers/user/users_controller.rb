class User::UsersController < ApplicationController
 before_action :authenticate_user!
  
def show
 @user = User.find(current_user.id)
 @post = @user.posts.all
end

 def edit
  @user = User.find(current_user.id)
 end
 
 def update
   @user = User.find(current_user.id)
    if @user.update(current_user.id)
      #redirect_to user_path, notice: "You have updated customer successfully."
    else
      render :edit
    end
 end
  
end
