class AddDescriptionToStocks < ActiveRecord::Migration[5.0]
  def change
    add_column :stocks, :description, :string, default: "Placeholder description"
  end
end
