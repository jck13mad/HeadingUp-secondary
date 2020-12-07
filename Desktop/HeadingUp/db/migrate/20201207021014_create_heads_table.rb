class CreateHeadsTable < ActiveRecord::Migration[6.0]
  def change
    craete_table :heads do |t|
      t.string :name
      t.integer :price
      t.string :brand
      t.string :gender
      t.string :img
      t.string :description
      t.timestamp :updated_at
    end
  end
end
