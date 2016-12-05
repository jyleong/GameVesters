class AddQuestionAnsweredToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :question_answered, :boolean, default: false
  end
end
