class Challenge < ApplicationRecord
  belongs_to :answer, optional: true
  has_many :user_challenges, dependent: :destroy
  has_many :users, through: :user_challenges
  has_one_attached :photo

  validates :difficulty, :name, :description_what, :description_why, :max_score, :duration, presence: true
end
