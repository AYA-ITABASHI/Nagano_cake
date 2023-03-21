class Public::CartItemsController < ApplicationController
  def index
   @cart_items=current_customer.cart_items

  end

  def create
   @cart_items=CartItem.new(cart_item_params)
   @cart_items.save

   redirect_to public_cart_items_path
  end

  def destroy
  end

  def destroy_all
  end

  def update
  end


private
  def cart_item_params
   params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

end