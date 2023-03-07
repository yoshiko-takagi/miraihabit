class ChallengesController < ApplicationController

  def index
    if params[:challenge].present?
      if params[:challenge][:category].present? && params[:challenge][:difficulty].present?
        @challenges = policy_scope(Challenge).where(category: params[:challenge][:category].downcase, difficulty: params[:challenge][:difficulty].to_i)
      elsif params[:challenge][:category].present?
        @challenges = policy_scope(Challenge).where(category: params[:challenge][:category].downcase)
      elsif params[:challenge][:difficulty].present?
         @challenges = policy_scope(Challenge).where(difficulty: params[:challenge][:difficulty].to_i)
      end
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
