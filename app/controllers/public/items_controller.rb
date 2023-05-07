class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
   @items=Item.all
  end

  def show
   @item= Item.find(params[:id])
   @cart_items=CartItem.new
   @cart_items.customer_id=current_customer
  end

end

private
 def items_params
  params.require(:item).permit( :image, :name, :price, :introduction)

 end