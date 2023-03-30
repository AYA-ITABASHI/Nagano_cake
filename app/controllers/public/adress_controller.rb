class Public::AdressController < ApplicationController
  def index
    @adress=Adress.new
    @adresses=Adress.all
  end

  def edit
   @adress=Adress.find(params[:id])
  end

  def create
    @adress=Adrress.new(adress.params)
    @adress.save
    redirect_to public_adresses_path
  end

  def update
    @adress=Adress.find(params[:id])
    @adress.update
    redirect_to public_adresses_path
  end

  def destroy
    @adress=Adress.find(params[:id])
    @adress.destroy
    redirect_to public_adresses_path
  end


  private
   def adress.params
     params.require(:adress).permit(:name, :postal_code, :address)
   end
end
