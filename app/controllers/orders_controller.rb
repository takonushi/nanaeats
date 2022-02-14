class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :index
    end
  end
end

private
def set_item
  @item = Item.find(params[:item_id])
end

def order_params
  params.require(:order).permit(:order_comment).merge(user_id: current_user.id, item_id: @item.id, order_date: Date.today, order_status: 1)
end
