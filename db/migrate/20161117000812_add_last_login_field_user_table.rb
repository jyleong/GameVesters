class AddLastLoginFieldUserTable < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :last_login, :datetime, null: true
  end
end
