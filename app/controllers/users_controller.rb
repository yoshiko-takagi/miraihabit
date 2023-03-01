class UsersController < ApplicationController
  def dashboard
    @user = current_user
    authorize current_user
  end

end
