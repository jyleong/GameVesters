class ChangeCurrencyColumn < ActiveRecord::Migration[5.0]
  def self.up
    change_column :users, :currency, :decimal
  end
  def self.down
    change_column :users, :currency, :float
  end
end
