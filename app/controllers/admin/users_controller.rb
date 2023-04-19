class Admin::UsersController < ApplicationController
before_action :authenticate_admin!

def index
 @users = User.all
end

def show
 @user = User.find(params[:id])
 @post = @user.posts
end

def search
 if params[:q].present?
    @q = params[:q]
    @user = User.where("name LIKE ?", "%#{@q}%")
 else
    @user = []
 end
end

end