class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [ :index, :create ]
  before_action :login_item, only: [ :index, :create ]
  def index
    @order_address = OrderAddress.new
  end
  
  def create
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
  
  def set_item
    @item = Item.find(params[:item_id]) 
  end
  
  def login_item
    if current_user.id == @item.user_id || @item.order != nil 
       redirect_to root_path 
    end
  end
end