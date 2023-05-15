class User::FavoritesController < ApplicationController
  
 def create
  #postテーブルのpost_id(主キー)を取り出す。
  @post = Post.find(params[:post_id])
  #いいね=ログイン中のユーザーのいいね(いいねされた投稿id:投稿のid)
  favorite = current_user.favorites.new(post_id: @post.id)
  favorite.save
  redirect_to post_path(@post)
 end

 def destroy
  @post = Post.find(params[:post_id])
  favorite = current_user.favorites.find_by(post_id: @post.id)
  favorite.destroy
  redirect_to post_path(@post)
 end

 def index
   @user = User.find(params[:user_id])
   #mapを使用することで、簡単に格納ができるとのこと
   @favorite_posts = @user.favorites.map(&:post)
   @message = "いいねした機能はありません。" if  @favorite_posts.empty?
 end

end


