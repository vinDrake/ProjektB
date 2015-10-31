class AddQuestionFeedToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :question_feed, :string
  end
end
