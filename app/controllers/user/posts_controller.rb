class User::PostsController < ApplicationController

 def new
  @post = Post.new
 end
 
 
 def create
  @post = Post.new(post_params)
  @post.user_id = current_user.id
  #タグの追加
  tag_list=params[:post][:name]
  if @post.save
     @post.save_tag(tag_list)#タグ
   redirect_to post_path(@post)#タグ
  else
   @posts = Post.all
   render :index
  end
 end


 def show
  @tag_list=Tag.all
  @post = Post.find(params[:id])
  #コメント機能の記述
  @post_comment = PostComment.new
  #タグ機能の記述
  @post_tags = @post.tags
 end
 
 
 def edit
  @post = Post.find(params[:id])
 end
 
 def update
  @post = Post.find(params[:id])
  if @post.update(post_params)
  redirect_to post_path(@post)
  else
  @posts = Post.all
  render :index
  end
 end
 
 
 def index
  @posts = Post.all
  @tag_list=Tag.all
 end
 
 def search
  if params[:item_name].present?
     @posts = Post.where('item_name LIKE ?', "%#{params[:item_name]}%")
  else
     @posts = Post.none
  end
 end

 
 private

 def post_params
  params.require(:post).permit(:item_name, :item_description, :image)
 end


end



