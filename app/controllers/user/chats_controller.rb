class User::ChatsController < ApplicationController
  
def new
 @chat = Chat.new
end

def create
 @chat = Chat.new(chat_params)
 @chat.user_id = current_user.id
  if @chat.save
    flash[:notice] = "リクエストは無事送信されました"
    redirect_to tags_path(@post)
    
  else
   render :new
  end
end

 private

 def chat_params
  params.require(:chat).permit(:content)
 end

end
