class CreateUserOwnedStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :user_owned_stocks do |t|
      t.integer :user_id
      t.integer :stock_id
      t.integer :quantity_owned

      t.timestamps
    end
  end
end
