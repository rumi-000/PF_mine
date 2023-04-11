class User::HomesController < ApplicationController
  before_action :authenticate_user!,except: [:top,:about]

 def top
 end
 
 def choice
 end
 
 def about
 end
  
end
