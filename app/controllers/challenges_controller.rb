class ChallengesController < ApplicationController

  def index
    @challenges = policy_scope(Challenge)
    @user_challenge = UserChallenge.new
  end

  def show
    @challenge = Challenge.find(params[:id])
    @user_challenge = UserChallenge.new
    authorize @challenge
  end
end
