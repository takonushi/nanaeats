class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @orders = Order.all
    @items = Item.order(quantity: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy if current_user.id == item.user_id && item.order.nil?
    redirect_to root_path
  end

  def destroy_all_order
    binding.pry
    Order.destroy_all if user_signed_in?
    redirect_to root_path
  end
  private

  def item_params
    params.require(:item).permit(:name, :price, :retailer, :explanation, :quantity, :item_class_id, :image).merge(user_id: current_user.id)
  end
end
