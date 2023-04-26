class User::SearchesController < ApplicationController
   before_action :authenticate_user!

def search
  if params[:q].present?
    @q = params[:q]
    @posts = Post.joins(:tags).where("posts.item_name LIKE ? OR tags.name LIKE ?", "%#{@q}%", "%#{@q}%").page(params[:page])
    @total_pages = @posts.total_pages if @posts.present?
  else
    @posts = []
  end
end

end
