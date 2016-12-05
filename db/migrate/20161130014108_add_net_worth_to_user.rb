class AddNetWorthToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :current_net_worth, :decimal, default: 0.0
  end
end
