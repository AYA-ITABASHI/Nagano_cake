class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order=@order_detail.order
    @order_details = @order.order_details.all
    @order_detail.update(order_detail_params)
   
    if @order_detail.making_status == "production"
      @order.update(order_status: "production")
    end
   if @order.order_details.all? { |order_detail| order_detail.making_status == "production_completed" }
    @order.update(order_status: "shipping_preparation")
   end
    redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status,:item_id, :order_id,:amount, :unit_price)
  end

end
