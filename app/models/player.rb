class Player < ActiveRecord::Base
  has_secure_password

  has_many :answers
  has_many :questions, through: :answers
  has_many :duels
  has_many :opponents, through: :duels
end
