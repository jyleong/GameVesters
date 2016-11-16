class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :qid
      t.integer :reward
      t.text :content

      t.timestamps
    end
  end
end
