class UserChallengesController < ApplicationController

  def index
    @user_challenges = policy_scope(UserChallenge)

    start_date = params.fetch(:start_date, Date.today).to_date

    @user_challenges = UserChallenge.where(user: current_user, created_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    # @user_challenges = current_user.user_challenges
    @schedule = {}

    @user_challenges.each do |user_challenge|
      user_challenge.schedule.each do |date, completed|
        @schedule[date] = [] unless @schedule[date]
        @schedule[date] << user_challenge
      end
    end
  end

  def update
    @user_challenge = UserChallenge.find(params[:id])
    authorize @user_challenge
    @user_challenge.schedule[Date.today.to_s] = !@user_challenge.schedule[Date.today.to_s]
    @user_challenge.save
    redirect_to calendar_path
  end
end
