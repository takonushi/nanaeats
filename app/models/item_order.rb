class ItemOrder
  include ActiveModel::Model
  attr_accessor(
    :quantity,
    :order_date, :order_comment, :order_status_id, :user_id, :item_id,
    :id, :created_at, :datetime, :updated_at, :datetime
  )

  def update(params, order)
    # paramsの中のquantityの情報を削除と同時に返り値としてタグの情報を変数に代入
    item_quantity = params.delete(:quantity)

    item = Item.where(id: order[:item_id])
    order.update(params)
    item.update(quantity: item_quantity)
  end
end
