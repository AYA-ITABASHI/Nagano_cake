class Public::ItemsController < ApplicationController
  def index
   @items=Item.all
  end

  def show
   @item= Item.find(params[:id])
   @cart_items=CartItem.new
  end

end

private
 def items_params
  params.require(:item).permit( :image, :name, :price, :introduction)
  
 end