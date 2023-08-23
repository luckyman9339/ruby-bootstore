class AddQuantityAndPriceToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :quantity, :integer
    add_column :books, :price, :decimal
  end
end
