class Admin::UsersController < ApplicationController
before_action :authenticate_admin!

def index
 @users = User.all
end

def show
 @user = User.find(params[:id])
 @post = @user.posts
end

# 追加
def update
  @user = User.find(params[:id])
   if @user.update(user_params)
    redirect_to admin_user_path
   else
    @user = User.find(params[:id])
    render admin_user_path
   end
end

def search
 if params[:q].present?
    @q = params[:q]
    @user = User.where("name LIKE ?", "%#{@q}%")
 else
    @user = []
 end
end

private

 def user_params
  params.require(:user).permit(:is_deleted)
 end

end

