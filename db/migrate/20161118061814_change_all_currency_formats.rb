class ChangeAllCurrencyFormats < ActiveRecord::Migration[5.0]
  def self.up
    change_column :questions, :reward, :decimal
    change_column :stocks, :current_price, :decimal
    change_column :transactions, :current_stock_val, :decimal
    change_column :transactions, :total_price, :decimal
  end
  def self.down
    change_column :questions, :currency, :float
    change_column :stocks, :current_price, :float
    change_column :transactions, :current_stock_val, :float
    change_column :transactions, :total_price, :float
  end
end
