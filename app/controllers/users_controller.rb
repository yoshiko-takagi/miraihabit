class UsersController < ApplicationController

  def dashboard
    @user = current_user
    @user_score = @user.score
    @user_challenge
    authorize current_user
  end

end
