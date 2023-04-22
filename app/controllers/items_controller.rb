class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index] 

  def index
    # @items = Item.all
  end
  
  # def create
    # Tweet.create(tweet_params)
  # end





  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
  def item_params
    params.require(:item).permit(:name, :content, :category_id, :condition_id, :postage_id, :area_id, :number_id, :price).merge(user_id: current_user.id)
  end
end