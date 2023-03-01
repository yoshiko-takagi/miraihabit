class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true
  validates :score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :user_answers
  has_many :answers, through: :user_answers
  has_many :answer_challenges, through: :answers, source: :challenge
  has_many :user_challenges
  has_many :challenges, through: :user_challenges

  def total_score
    challenges.where(completed: true).sum(:score) + answer_challenges.where(completed: true).sum(:score)
  end
end
