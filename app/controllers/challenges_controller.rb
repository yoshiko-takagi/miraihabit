class ChallengesController < ApplicationController

  def index
    @challenges = policy_scope(Challenge)
    @user_challenge = UserChallenge.new
  end

  # def create

  # end
end
