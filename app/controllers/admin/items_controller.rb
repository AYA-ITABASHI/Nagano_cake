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
    @item=Item.find(params[:id])

  end

  def edit
    @item=Item.find(params[:id])
  end

  def update
   @item= Item.find(params[:id])
   @item.update(item_params)
   redirect_to admin_item_path(@item.id)
  end

    private
  def item_params
    params.require(:item).permit( :image, :name, :introduction, :genre_id, :price, :is_active)
  end
end
