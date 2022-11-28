class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.date :purchase_date
      t.float :price_paid
      t.references :user, null: false, foreign_key: true
      t.references :list_product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
