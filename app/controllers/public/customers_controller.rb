class Public::CustomersController < ApplicationController
 before_action :customer_state, only: [:create]

 def show
  @customer=current_customer
 end


 def edit
  @customer=Customer.find(params[:id])
 end

 def update
  @customer=Customer.find(params[:id])
  @customer.update(customer_params)
  redirect_to public_mypage_path(@customer)
 end

 def unsubscribe
 end

 def withdrawal
   @customer=current_customer
   @customer.update(is_deleted: true)
   reset_session

  redirect_to root_path
 end


private

 def customer_params
    params.require(:customer).permit(:last_name, :last_name_kana, :first_name, :first_name_kana,
    :address, :postal_code, :telephone_number,:email,:is_deleted)
 end


end