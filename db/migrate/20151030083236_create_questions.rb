class CreateQuestions < ActiveRecord::Migration

  def change
    create_table :questions do |t|
      t.string :question_therm
      t.string :correct_answer

      t.timestamps null: false
    end
  end
end
