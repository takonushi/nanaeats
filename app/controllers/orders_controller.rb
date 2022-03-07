class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create, :edit]
  before_action :set_order, only: [:edit, :update]
  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      LineNotify.send('料理の注文が入りました!!')
      redirect_to root_path
    else
      render :index
    end
  end

  def edit
    order_attributes = @order.attributes
    @item_order = ItemOrder.new(order_attributes)
  end

  def update
    @item_order = ItemOrder.new(item_order_params)
    if @item_order.valid?
      @item_order.update(item_order_params, @order)
      redirect_to root_path
    else
      render :edit
    end
  end
end

private

def set_item
  @item = Item.find(params[:item_id])
end

def set_order
  @order = Order.find(params[:id])
end

def order_params
  params.require(:order).permit(:order_comment).merge(user_id: current_user.id, item_id: @item.id, order_date: Date.today,
                                                      order_status_id: 1)
end

def item_order_params
  params.require(:item_order).permit(:quantity, :order_date, :order_comment, :order_status_id)
end
