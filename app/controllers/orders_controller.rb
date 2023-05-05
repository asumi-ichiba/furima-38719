class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index


  def index
    @order_departs = OrderDeparts.new
    @item = Item.find(params[:item_id])
  end


  def create
    @item = Item.find(params[:item_id])
    @order_departs = OrderDeparts.new(order_params) 
    if @order_departs.valid?
      pay_item
      @order_departs.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_departs).permit(:post_cord, :area_id, :municipalities, :address, :building, :telephone).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token], 
      currency: 'jpy' 
    )
  end
end