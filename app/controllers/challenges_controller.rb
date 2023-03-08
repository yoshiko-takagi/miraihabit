class ChallengesController < ApplicationController

  def index
    @challenges = policy_scope(Challenge)
    @user_challenges = UserChallenge.where(user: current_user, challenges: @challenges)
    @active_user_challenges = @user_challenges.select { |user_challenge| user_challenge.active?}
    @active_challenges = @active_user_challenges.map {|active_user_challenge| active_user_challenge.challenge}
    @non_active_challenges = @challenges - @active_challenges

    if params.dig(:challenge, :category).present? && params.dig(:challenge, :difficulty).present?
      @challenges = @non_active_challenges.where(category: params.dig(:challenge, :category).downcase, difficulty: params.dig(:challenge, :difficulty).to_i)
    elsif params.dig(:challenge, :category).present?
      @challenges = @non_active_challenges.where(category: params.dig(:challenge, :category).downcase)
    elsif params.dig(:challenge, :difficulty).present?
       @challenges = @non_active_challenges.where(difficulty: params.dig(:challenge, :difficulty).to_i)
    else
      @challenges = @non_active_challenges
    end
    # raise
    @user_challenge = UserChallenge.new
  end

  def show
    @challenge = Challenge.find(params[:id])
    @user_challenge = UserChallenge.new
    authorize @challenge
  end
end
