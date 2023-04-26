class Admin::ChatsController < ApplicationController
  
# 全てのリクエストを取得
def index
  @chats = Chat.all
end

# リクエストの削除
def destroy
  @chat = Chat.find(params[:id])
  if @chat.destroy
     redirect_to admin_tags_path
  else
    @chats = Chat.all
    render 'index'
  end
end

# 作成はユーザーのみができるので、user側に記載
# (newとcreate)

end