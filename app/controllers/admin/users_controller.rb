class Admin::UsersController < ApplicationController
before_action :authenticate_admin!

 #会員の一覧
 def index
  @users = User.all
 end
         
 #会員詳細
 def show
  @user = User.find(params[:id])
  @post = @user.posts.page(params[:page])
 end
         
 #会員のステータス更新
 def update
  @user = User.find(params[:id])
  if @user.update(user_params)
     redirect_to admin_user_path
  else
     @user = User.find(params[:id])
     render admin_user_path
  end
 end
         
 #会員の検索
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
