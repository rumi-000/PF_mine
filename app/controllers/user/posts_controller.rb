class User::PostsController < ApplicationController
#before_action :ensure_item, only: [:show, :edit, :update]
#メンターにきく
  
 def new
  @post = Post.new
 end
 
  #postの新規投稿
 def create
  @post = Post.new(post_params)
  if @post.save!
   redirect_to post_path(@post)
  else
   @posts = Post.all
   render :index
  end
 end
  
 def show
  @post = Post.find(params[:id])
 end

 def index
  @posts = Post.all
 end
  
private

 def post_params
  params.require(:post).permit(:item_name, :item_description)
  #params.require(:post).permit(:item_name, :item_description )
 end
  #params.permit(:item_name, :item_description)
  #params.require(:post).permit(:item_name, :item_description )
  #↑実装すると画面から消える。メンターにきく
  
end
