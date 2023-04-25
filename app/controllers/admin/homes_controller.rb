class Admin::HomesController < ApplicationController
  def top
    @orders=Order.all
  end
  
  private
   def oreder_params
    params.require(:oreder).permit( :customer_id, :order_id)
   end
end
