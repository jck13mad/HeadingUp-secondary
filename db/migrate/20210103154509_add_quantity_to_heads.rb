class AddQuantityToHeads < ActiveRecord::Migration[6.0]
  def change
    add_column :heads, :quantity, :integer
  end
end
