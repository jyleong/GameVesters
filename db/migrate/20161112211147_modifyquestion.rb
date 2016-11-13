class Modifyquestion < ActiveRecord::Migration[5.0]
  def change
  	 add_column :questions, :ans1, :string
  	 add_column :questions, :ans2, :string
  	 add_column :questions, :ans3, :string
  	 add_column :questions, :ans4, :string
  	add_column :questions, :answer, :string	
  end
end
