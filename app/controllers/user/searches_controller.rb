class User::SearchesController < ApplicationController
  
  def search
   @q = params[:q]
   @posts = Post.joins(:tags).where("posts.item_name LIKE ? OR tags.name LIKE ?", "%#{@q}%", "%#{@q}%")
  end

end