class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :stock_id
      t.float :current_stock_val
      t.integer :quantity
      t.float :total_price
      t.boolean :buy_sell

      t.timestamps
    end
  end
end
