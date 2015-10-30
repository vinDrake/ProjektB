class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|

      t.timestamps null: false
    end


  create_table :matches_players do |t|
    t.belongs_to :match, index: true
    t.belongs_to :player, index: true
  end

  create_table :matches_questions do |t|
    t.belongs_to :match, index: true
    t.belongs_to :question, index: true
  end
end
end
