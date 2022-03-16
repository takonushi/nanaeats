class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @orders = Order.all
    @items = Item.order(quantity: 'DESC')
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  def destroy
    item = Item.find(params[:id])
    item.destroy if current_user.id == item.user_id && item.order.nil?
    redirect_to root_path
  end

  def search
    @orders = Order.all
    # params[:q]がnilでない且つ、params[:q][:name]がnilでない時
    if params[:q]&.dig(:name)
      # squishメソッドで余分なスペースを削除
      squished_keywords = params[:q][:name].squish
      ## 半角スペースを区切り文字として配列を生成し、paramsに入れる
      params[:q][:name_cont_any] = squished_keywords.split(' ')
    end
    @q = Item.ransack(params[:q])
    @items = @q.result
  end

  def destroy_all_order
    Order.destroy_all if user_signed_in?
    redirect_to root_path
  end

  def all_edit
    @items = Item.all
  end

  def all_update
    @items = items_params.keys.each do |id|
      item = Item.find(id)
      item.update_attributes(items_params[id])
    end
    redirect_to root_path
  end

  def new_release
    @items = Item.all
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :retailer, :explanation, :quantity, :item_class_id,
                                 :image).merge(user_id: current_user.id)
  end

  def items_params
    params.delete(:_method)
    params.delete(:commit)
    params.delete(:authenticity_token)
    params.permit(items: [:name, :quantity])[:items]
  end
end
