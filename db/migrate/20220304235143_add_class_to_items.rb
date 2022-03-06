class AddClassToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :item_class_id, :integer, null: false
  end
end
