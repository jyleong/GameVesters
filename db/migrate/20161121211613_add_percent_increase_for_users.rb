class AddPercentIncreaseForUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :percent_increase, :decimal
  end
end
