class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index


  def index
    @order_departs = OrderDeparts.new
  end


  def create
    @order_departs = OrderDeparts.new(order_params)
    if @order_departs.valid?
      @order_departs.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_departs).permit(:post_cord, :area_id, :municipalities,:address, :building, :telephone).merge(user_id: current_user.id)
  end
end
