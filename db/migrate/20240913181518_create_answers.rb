class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers do |t|
      t.string :image
      t.string :answer
      t.boolean :is_true
      t.references :question,foreign_key: true
      t.timestamps
    end
  end
end
