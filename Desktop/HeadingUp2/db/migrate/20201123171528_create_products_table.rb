class CreateProductsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :brand
      t.string :img
      t.string :gender
      t.string :description
      t.timestamp :updated_at
    end
  end
end
