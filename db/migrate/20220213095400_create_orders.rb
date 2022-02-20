class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.date        :order_date,    null: false
      t.text        :order_comment
      t.integer     :order_status_id,  null: false
      t.references  :user,          null: false, foreign_key: true
      t.references  :item,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
