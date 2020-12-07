class ChangeCartIdColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :cart_id, :bag_id
  end
end
