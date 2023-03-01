class Question < ApplicationRecord
  # has_many :user_answers
  has_many :answers, dependent: :destroy
  validates :content, presence: true
end
