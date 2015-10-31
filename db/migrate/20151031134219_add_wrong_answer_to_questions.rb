class AddWrongAnswerToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :wrong_answer, :string
  end
end
