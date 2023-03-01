class UsersController < ApplicationController

  def dashboard
    @user = current_user
    @user_score = @user.score
    authorize current_user
  end


  # def dashboard
  #   if user_answer_filtered
  #   @currect_score = user_score + completed_challenge_score
  #   end
  #   authorize currect_user
  # end

  # private

  # def user_score
  #   @user = User.find(params[:id])
  #   @user_score = @user.score
  #   # @challenge_score = UserChallenge.find(params[:challenge_id])

  # end

  # # if user answers option 1 during assessment test, its question_id shouldn't be included in challenges Model.
  # def user_answer_filtered
  #   @user_answer = UserAnswer.find(params[:answer_id])
  #   @answer = Answer.content.last # option 2
  #   if @user_answer.answer_id == @answer
  #     @user_answer.save
  #   end
  # end

  # # if user's challenge_id is completed, save the score of that challenge.
  # #
  # def completed_challenge_score

  # end
end
