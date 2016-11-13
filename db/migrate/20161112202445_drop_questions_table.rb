class DropQuestionsTable < ActiveRecord::Migration[5.0]
   def up
    drop_table :questions
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
