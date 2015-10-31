class AddGuessToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :guess, :string
  end
end
