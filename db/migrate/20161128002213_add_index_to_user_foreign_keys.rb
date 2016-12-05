class AddIndexToUserForeignKeys < ActiveRecord::Migration[5.0]
  def change
    # Indexes for faster queries
    add_index :notifications, :user_id
    add_index :transactions, :user_id
    add_index :user_owned_stocks, :user_id
    add_index :user_stocks, :user_id
  end
end
