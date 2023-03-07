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
  has_many :completed_challenges, through: :answers, source: :challenge
  # normal has many
  has_many :user_challenges
  # filtered has many
  has_many :completed_user_challenges, -> { where completed: true }, class_name: "UserChallenge"
  # normal has many
  has_many :challenges, through: :user_challenges
  # filtered has many
  has_many :completed_challenges, through: :completed_user_challenges, source: :challenge

  has_one_attached :photo

  def total_score
    user_challenges.sum(:score) + answer_challenges.sum(:max_score)
  end
end
