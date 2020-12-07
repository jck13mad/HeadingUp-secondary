class RenameProductsTableToHeadsTable < ActiveRecord::Migration[6.0]
  def self.up
    rename_table :products, :heads
  end

  def self.down
    rename_table :heads, :products
  end
end
