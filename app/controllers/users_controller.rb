class UsersController < ApplicationController
 def show
  @item = User.find(params[:user_id]).items
  @favorite_items = User.find(params[:user_id]).favorites
   
 end
end