class AddLiveToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :alive, :boolean
  end
end
