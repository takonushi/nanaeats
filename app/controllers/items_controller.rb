class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    end
  #  else
  #  render :new
  #  上記記載を入れると登録が出来なくなる不具合発生中
  end
  
  private
  def item_params
     params.require(:item).permit(:name, :price, :retailer, :explanation, :quantity, :image).merge(user_id: current_user.id)
  end

end
