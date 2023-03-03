class ChallengesController < ApplicationController

  def index
      if params.dig(:challenge, :category).present? && params.dig(:challenge, :difficulty).present?
        @challenges = policy_scope(Challenge).where(category: params.dig(:challenge, :category).downcase, difficulty: params.dig(:challenge, :difficulty).to_i)
      elsif params.dig(:challenge, :category).present?
        @challenges = policy_scope(Challenge).where(category: params.dig(:challenge, :category).downcase)
      elsif params.dig(:challenge, :difficulty).present?
         @challenges = policy_scope(Challenge).where(difficulty: params.dig(:challenge, :difficulty).to_i)
        else
          @challenges = policy_scope(Challenge)
        end
    @user_challenge = UserChallenge.new
  end

  def show
    @challenge = Challenge.find(params[:id])
    @user_challenge = UserChallenge.new
    authorize @challenge
  end
end
