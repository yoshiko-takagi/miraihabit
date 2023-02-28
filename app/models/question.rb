class Question < ApplicationRecord
  has_many :user_answers
  has_many :answers
  validates :content, presence: true
end
