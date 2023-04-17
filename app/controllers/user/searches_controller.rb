class User::SearchesController < ApplicationController
  
  #def search
   #@q = params[:q]
   #@posts = Post.joins(:tags).where("posts.item_name LIKE ? OR tags.name LIKE ?", "%#{@q}%", "%#{@q}%") if params[:q].present?
  #end

def search
  if params[:q].present?
    @q = params[:q]
    @posts = Post.joins(:tags).where("posts.item_name LIKE ? OR tags.name LIKE ?", "%#{@q}%", "%#{@q}%")
  else
    @posts = []
  end
end

end

