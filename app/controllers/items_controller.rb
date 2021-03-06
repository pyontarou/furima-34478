class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index, :search]
  before_action :set_item, only: [ :show, :edit, :update]
  before_action :login_item, only: [ :edit, :update]

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
    @message = Message.new
    @messages = @item.messages.includes(:user)
    @like = Like.new
  end
  
  def edit
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
  
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  def search
    @items = Item.search(params[:keyword])
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :state_id, :postage_id, :prefectures_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])  
  end
  
  def login_item
    return redirect_to root_path if current_user.id != @item.user_id
    return redirect_to root_path if @item.order != nil 
   end
end
