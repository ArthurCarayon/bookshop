class AddColumnsToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :price, :integer
    add_column :books, :pricepromo, :integer
  end
end
