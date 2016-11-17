class AddChangeToStocks < ActiveRecord::Migration[5.0]
  def change
  	add_column :stocks, :amount_change, :float
  	add_column :stocks, :year_high, :float
  	add_column :stocks, :year_low, :float
  	
  end
end
