class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order=@order_detail.order
    @order_details = @order.order_details.all
    @order_detail.update(order_detail_params)

   if @order_details.all?(making_status: "production_completed")
      @order.update(order_status: "shipping_preparation")
     # 注文に紐づく注文詳細の製作ステータスが全部「製作完了」だったら
    # 注文の注文ステータスを「発送準備中」に更新
   end
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status,:item_id, :order_id,:amount, :unit_price)
  end

end
