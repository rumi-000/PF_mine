class User::TagsController < ApplicationController

def index
 @tags = Tag.all
end

def show
 @tags = Tag.all
 @tag = Tag.find(params[:id])
end

end
