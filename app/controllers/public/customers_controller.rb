class Public::CustomersController < ApplicationController
 def show
 end

 def edit
  @customer=Customer.find(params[:id])
 end

 def update
 end

 def unsubscribe
 end

 def withdrawal
 end
end
