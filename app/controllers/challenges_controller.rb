class ChallengesController < ApplicationController

  def index
    @challenges = policy_scope(Challenge)
  end

  def create

  end
end
