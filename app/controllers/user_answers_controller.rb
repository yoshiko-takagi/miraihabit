class UserAnswersController < ApplicationController
  def index
    @user_answer = policy_scope(UserAnswer)
    @user_challenge = UserChallenge.new
    # get only the challenges that are not already completed(from the test)
    @suggested_challenges = Challenge.select { |c| current_user.answer_challenges.exclude?(c) }
  end

  def create
    @user_answer = UserAnswer.new(user_answer_params)
    @user_answer.user = current_user
    authorize @user_answer
    if @user_answer.save
      # give the user some feedback
      if @user_answer.question != Question.last
        # move to next question
        @next_question = Question.where("id > ?", @user_answer.answer.question.id).first
        redirect_to question_path(@next_question)
      else
        # submit >
        # and go to results
        redirect_to user_answers_path
      end
    else
      render 'questions/show', status: :unprocessable_entity
    end
  end

  private

    # validates :start_date, presence: true
  def user_answer_params
    params.require(:user_answer).permit(:answer_id)
  end
end
