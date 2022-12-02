class AddNextPurchaseToListProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :list_products, :next_purchase, :date
  end
end
