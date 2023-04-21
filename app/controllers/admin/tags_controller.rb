class Admin::TagsController < ApplicationController
 before_action :authenticate_admin!
  
  def new
  end
  
  def create
   @tag = Tag.new(tag_params)
    if @tag.save
     redirect_to admin_tags_path
    else
     @tags = Tag.all
     render 'index'
    end
  end
  

  def index
  @tags = Tag.all
  @tag = Tag.new
  end

 def destroy
   @tag = Tag.find(params[:id])
   if @tag.destroy
   flash[:notice] = "タグは削除されました."
   redirect_to admin_tags_path
   else
   @tags = Tag.all
   render 'index'
   end
 end
 
 def edit
  @tag = Tag.find(params[:id])
 end
 
 def update
  @tag = Tag.find(params[:id])
  if @tag.update(tag_params)
  flash[:notice] = "タグは更新されました."
  redirect_to admin_tags_path
  else
   render 'edit'
  end
 end
 

private

def tag_params
 params.require(:tag).permit(:name, :description)
end

end
