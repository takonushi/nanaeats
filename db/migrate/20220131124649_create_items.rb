class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string    :name,             null: false
      t.integer   :price
      t.string    :retailer
      t.text      :explanation
      t.integer   :quantity,         null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
