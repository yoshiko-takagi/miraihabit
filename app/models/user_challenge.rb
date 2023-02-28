class UserChallenge < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  # validates :json ??
end
