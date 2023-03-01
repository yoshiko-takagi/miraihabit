class UserChallengesController < ApplicationController

  def index
    @user_challenges = policy_scope(UserChallenge)
  end
end
