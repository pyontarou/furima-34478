class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id]) 
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id]) 
    @order_address  = OrderAddress.new(order_params)
    if @order_address.valid?
       @order_address.save
       redirect_to root_path
    else
       render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:prefecture_code, :prefectures_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id).merge(user_id: current_user.id,item_id: params[:item_id])
  end
 

end