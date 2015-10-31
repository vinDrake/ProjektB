class CreateDuels < ActiveRecord::Migration
  def change
    create_table :duels do |t|
      t.string :question_set
      t.boolean :finish
      t.references :player_one, index: true, foreign_key: true
      t.references :player_two, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
