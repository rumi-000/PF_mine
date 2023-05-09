class User::PostsController < ApplicationController
before_action :authenticate_user!, only: [:new,:create,]

 def new
  @post = Post.new
  @tag = Tag.all
 end
 
 def create
  if params[:post][:tag_ids] == nil
    @tag = Tag.all
    redirect_to new_post_path
    return
  end
  @post = Post.new(post_params)
  @post.user_id = current_user.id

  if @post.save
   flash[:notice] = "投稿が作成されました."
    redirect_to post_path(@post)
  else
   @tag = Tag.all
   render :new
  end
 end
 

 def show
  @post = Post.find(params[:id])
  #コメント機能の記述
  @post_comment = PostComment.new
  @post_tags = @post.tags
  @user = @post.user
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
  @posts = Post.all.page(params[:page])
  @message = "何も投稿されていません。投稿してみましょう！" if @posts.empty?
 end
 
 def destroy
  @post = Post.find(params[:id])
  if @post.destroy
     flash[:notice] = "投稿は削除されました."
     redirect_to posts_path
  else
     posts = Post.all
     render 'index'
  end
 end
 

def search
  if params[:q].present?
    @q = params[:q]
    @posts = Post.joins(:tags).where("posts.item_name LIKE ? OR tags.name LIKE ?", "%#{@q}%", "%#{@q}%").page(params[:page])
  else
    @posts = []
  end
end

 private

 def post_params
  params.require(:post).permit(:item_name, :item_description, :image, tag_ids: [])
 end

def authenticate_user_or_admin!
  authenticate_user!
  unless current_user.admin? || current_user.member?
    redirect_to root_path, alert: "You must be a member or admin to access this page."
  end
end

end
