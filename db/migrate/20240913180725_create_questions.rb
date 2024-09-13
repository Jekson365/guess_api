class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :question, null: false
      t.integer :position
      t.timestamps
    end
  end
end
