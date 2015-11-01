class Player < ActiveRecord::Base
  has_secure_password

  has_many :answers
  has_many :questions, through: :answers
  has_many :tickets
  has_many :challenges, through: :tickets
#  has_many :duels
#  has_many :challengers, through: :duels, source: :player_one
#  has_many :opponents, through: :duels, source: :player_two
end
