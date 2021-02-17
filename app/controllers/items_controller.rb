class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :state_id, :postage_id, :prefectures_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
