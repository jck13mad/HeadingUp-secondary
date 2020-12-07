class ChangeProductIdToHeadId < ActiveRecord::Migration[6.0]
  def change
    rename_column :bag_items, :product_id, :head_id
  end
end
