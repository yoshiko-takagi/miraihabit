class ChallengesController < ApplicationController

  def index
    sql = <<~SQL
      CURRENT_DATE >= DATE(user_challenges.created_at) + challenges.duration + 1 -- INACTIVE
    SQL

    challenges_never_done = Challenge.all - current_user.challenges
    inactive_challenges = current_user.challenges.joins(:user_challenges).where(sql).distinct
    # We reload the records in SQL (so that we can use .where):
    @challenges = policy_scope(Challenge).where(id: challenges_never_done + inactive_challenges)

    if params.dig(:challenge, :category).present?
      @challenges = @challenges.where(category: params.dig(:challenge, :category).downcase)
    end

    if params.dig(:challenge, :difficulty).present?
      @challenges = @challenges.where(difficulty: params.dig(:challenge, :difficulty).to_i)
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
