class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create, :edit]
  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    binding.pry
    if @order.save
      LineNotify.send('料理の注文が入りました!!')
      redirect_to root_path
    else
      render :index
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

end

private
def set_item
  @item = Item.find(params[:item_id])
end

def order_params
  params.require(:order).permit(:order_comment).merge(user_id: current_user.id, item_id: @item.id, order_date: Date.today, order_status_id: 1)
end
