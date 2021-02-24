class LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @item = Item.find(params[:item_id])
    current_user.like(@item)
  end
  
  def destroy
    @item = Like.find(params[:id]).item
    current_user.unlike(@item)
  end
end
