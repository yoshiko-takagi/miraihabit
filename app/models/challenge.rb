class Challenge < ApplicationRecord
  belongs_to :answer
  has_many :user_challenges
  # has_many :users, through: :user_challenges

  validates :difficulty, :name, :description, :score, :duration, presence: true
end
