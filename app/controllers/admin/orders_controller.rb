class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order=Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order )
  end

  def update
    @order=Order.find(params[:id])
     @order.update(order_params)
    if @order.order_status == "payment_confirm"
      @order.order_details.update_all(making_status: "waiting_for_production")

    end
    redirect_to admin_order_path(@order)
  end
  private
   def order_params
     params.require(:order).permit(:customer_id, :order_status, :payment, :delivery_postal_code, :delivery_address, :delivery_name,
    :shipping_fee, :amount_billed)
   end
end
