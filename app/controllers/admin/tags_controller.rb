class Admin::TagsController < ApplicationController
  
  # ルーティングした
  def new
  end
  
  # ルーティングした
  def create
   @tag = Tag.new(tag_params)
    if @tag.save
     redirect_to admin_tags_path
    else
     @tags = Tag.all
     render 'index'
    end
  end
  
  # ルーティングした
  # ここで新規作成もできる様にする
  def index
  @tags = Tag.all
  @tag = Tag.new
  end

 def destroy
   tag = Tag.find(params[:id])
   if tag.destroy
   flash[:notice] = "タグは削除されました."
   redirect_to admin_tags_path
   else
   @tags = Tag.all
   render 'index'
   end
 end
 
private

def tag_params
 params.require(:tag).permit(:name)
end

end


