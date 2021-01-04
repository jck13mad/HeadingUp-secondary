class DropQuantityFromBagItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :bag_items, :quantity 
  end
end
