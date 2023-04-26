class Admin::TagsController < ApplicationController
 before_action :authenticate_admin!
  
  # index画面で作成するため無し
  def new
  end
  
 #タグの作成
  def create
   @tag = Tag.new(tag_params)
    if @tag.save
     redirect_to admin_tags_path
    else
     @tags = Tag.all
     render 'index'
    end
  end
  
　#タグの一覧
  def index
  @tags = Tag.all
  @tag = Tag.new
  end

 # タグの削除
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
 
　#タグの編集画面
  def edit
   @tag = Tag.find(params[:id])
  end
 
 #タグの更新
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
  params.require(:tag).permit(:name, :description, :image)
 end

end
