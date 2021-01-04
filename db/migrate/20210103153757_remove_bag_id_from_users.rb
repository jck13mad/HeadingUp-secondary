class RemoveBagIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :bag_id
  end
end
