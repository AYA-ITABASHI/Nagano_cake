class Public::AddressesController < ApplicationController
  def index
    @address=Address.new
    @addresses=current_customer.address

  end

  def edit
   @address=Address.find(params[:id])
  end

  def create
    @address=Address.new(address_params)
    @addresses.customer_id=current_customer.id
    @address.save
    redirect_to public_addresses_path
  end

  def update
    @address=Address.find(params[:id])
    @address.update
    redirect_to public_addresses_path
  end

  def destroy
    @address=Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end


  private
   def address_params
     params.require(:address).permit(:name, :postal_code, :address, :customer_id)
   end
end
