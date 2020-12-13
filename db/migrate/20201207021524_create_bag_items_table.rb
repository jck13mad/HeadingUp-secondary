class CreateBagItemsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :bag_items do |t|
      t.integer :user_id
      t.integer :head_id
      t.integer :quantity
      t.timestamp :updated_at
    end
  end
end
