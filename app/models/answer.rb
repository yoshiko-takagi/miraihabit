class Answer < ApplicationRecord
  belongs_to :question
  has_one :challenge, dependent: :destroy
  has_many :user_answers, dependent: :destroy
  validates :content, presence: true

  # def max_score
  #   self.challenge.max_score
  # end
end
