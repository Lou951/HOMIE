class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :item
      t.string :brand
      t.string :barcode

      t.timestamps
    end
  end
end
