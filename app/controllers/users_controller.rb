class UsersController < ApplicationController
  def dashboard
    @user = current_user
    authorize current_user
    @user_challenge = UserChallenge.new
  end

end
