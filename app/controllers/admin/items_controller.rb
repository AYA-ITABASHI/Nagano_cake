class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items=Item.all
  end

  def new
    @item=Item.new
  end

  def create
    @items = Item.new(item_params)
   if @items.save
      redirect_to admin_items_path
   else
    render :new
   end
  end

  def show
  end

  def edit
  end


    private
  def item_params
    params.require(:item).permit( :images, :name, :introduction, :genre_id, :price, :is_activ)
  end
end
