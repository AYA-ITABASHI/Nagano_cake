class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @orders=Order.page(params[:page])
  end

  private
   def oreder_params
    params.require(:oreder).permit( :customer_id, :order_id)
   end
end
