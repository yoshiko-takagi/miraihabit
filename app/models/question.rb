class Question < ApplicationRecord
  has_many :user_answers

  validates :content, presence: true
end
