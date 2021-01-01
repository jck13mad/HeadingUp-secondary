class CreateBagItemId < ActiveRecord::Migration[6.0]
  def change
    add_column :heads, :bag_item_id, :integer
  end
end
