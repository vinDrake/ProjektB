class AddQuestionsToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :question_array, :text
  end
end
