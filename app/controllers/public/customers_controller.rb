class Public::CustomersController < ApplicationController
 def show
  @customer=current_customer
 end


 def edit
  @customer=Customer.find(params[:id])
 end

 def update
  @customer=Customer.find(params[:id])
  @customer.update(params_update)
  redirect_to public_mypage_path(customer_id)
 end

 def unsubscribe
 end

 def withdrawal
 end
end

private

 def customer_params
    params.require(:customer).permit(:last_name, :last_name_kana, :first_name, :first_name_kana,
    :adress, :postal_code, :telephone_number,:email)
 end