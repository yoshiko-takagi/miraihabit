class Answer < ApplicationRecord
  belongs_to :question
  has_one :challenge

  validates :content, presence: true
end
