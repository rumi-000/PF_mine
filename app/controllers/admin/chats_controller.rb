class Admin::ChatsController < ApplicationController
  
def index
  @chats = Chat.all
end

def destroy
  @chat = Chat.find(params[:id])
  if @chat.destroy
     redirect_to admin_tags_path
  else
    @chats = Chat.all
    render 'index'
  end
end

end