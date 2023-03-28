class Admin::HomesController < ApplicationController
  def top
    @order=Order.all
  end
  
  private
   def oreder_params
    params.require(:oreder).permit(:cart_item_id, :customer_id, :order_id)
   end
end
