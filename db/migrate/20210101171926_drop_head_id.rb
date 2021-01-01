class DropHeadId < ActiveRecord::Migration[6.0]
  def change
    remove_column :bag_items, :head_id 
  end
end
