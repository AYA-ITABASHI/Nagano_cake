class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customer=Customer.page(params[:page])
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def show
    @customer= Customer.find(params[:id])
  end

  def update
    @customer= Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :last_name_kana, :first_name, :first_name_kana,
    :address, :postal_code, :telephone_number,:email, :is_deleted)
  end

end
