class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id]) 
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id]) 
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  
  def order_params
    params.require(:order_address).permit(:prefecture_code, :prefectures_id, :city, :house_number, :building_name, :phone_number).merge(token: params[:token],user_id: current_user.id,item_id: params[:item_id])
  end
  
  def pay_item
    Payjp.api_key = "sk_test_b0e6ae1a24fd570edec47e1e"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
  
 

end