class Challenge < ApplicationRecord
  belongs_to :answer, optional: true
  has_many :user_challenges, dependent: :destroy
  has_many :users, through: :user_challenges

  validates :difficulty, :name, :description, :max_score, :duration, presence: true
end
