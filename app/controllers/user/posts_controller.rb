class User::PostsController < ApplicationController
#before_action :ensure_item, only: [:show, :edit, :update]
#メンターにきく
  
 def new
 end
  
 def create
  #postの新規投稿
  @post = Post.new(post_params)
  @post.save ? (redirect_to post_path(@post.id)) : (render :new)
 end
  
 def show
  @post = Post.find(params[:id])
 end

 def index
 end
  
private

 def post_params
  #params.require(:post).permit(:item_name, :item_description )
  params.permit(:item_name, :item_description)
  #params.permit(:tag_id, :item_name, :item_description)
 end
  
end


