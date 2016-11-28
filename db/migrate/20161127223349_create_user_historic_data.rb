class CreateUserHistoricData < ActiveRecord::Migration[5.0]
  def change
    create_table :user_historic_data do |t|
      t.integer :user_id
      t.decimal :net_worth

      t.timestamps
    end

    add_index :user_historic_data, :user_id
  end
end
