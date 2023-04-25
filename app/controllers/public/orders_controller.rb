class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    @address=Address.new
  end

  def index
   @orders=current_customer.orders.all


  end

  def show
   @order = Order.find(params[:id])
   @order_details = OrderDetail.where(order_id: @order)
   

  end




  def confirm
   
   if current_customer.cart_items.present?
     @cart_items=current_customer.cart_items
     @shipping_fee = 800
   else
    redirect_to public_cart_items_path
   end

    if params[:order][:address_method] == "0"
      @order = Order.new(order_params)
      @order.delivery_postal_code = current_customer.postal_code
      @order.delivery_address = current_customer.address
      @order.delivery_name = current_customer.last_name + current_customer.first_name

    elsif  params[:order][:address_method] == "1"
     @order = Order.new(order_params)
     @address = Address.find(params[:order][:address_id])
     @order.delivery_postal_code = @address.postal_code
     @order.delivery_address = @address.address
     @order.delivery_name = @address.name

    elsif @address=Address.new(address_params)
     if @order=Order.new(order_params)
       @order.delivery_postal_code = @address.postal_code
       @order.delivery_address = @address.address
       @order.delivery_name = @address.name

      render :confirm
     end

    else
     render :new
    end
   @order_details=Order.new
  end

   def create
    @cart_items=current_customer.cart_items
    @order=Order.new(order_params)
         @cart_items.each do |cart_item|
          @order_details = @order.order_details.new
          @order_details.item_id = cart_item.item.id
          @order_details.unit_price = cart_item.item.with_tax_price
          @order_details.amount = cart_item.amount
          @order_details.order_id = @order.id
          @order_details.making_status= 0
          @order_details.save
        end
    CartItem.destroy_all
    render :complete
   end

  def complete
  end

  private
   def order_params
    params.require(:order).permit(:payment, :delivery_postal_code, :delivery_address, :delivery_name, :customer_id,
    :shipping_fee, :amount_billed, :order_status)
   end

    def address_params
     params.require(:address).permit(:name, :postal_code, :address, :customer_id)
    end
end
