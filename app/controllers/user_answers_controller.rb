class UserAnswersController < ApplicationController
  def index
  end

  def create
    @user_answer = UserAnswer.new(user_answer_params)
    @user_answer.user = current_user
    authorize @user_answer
    if @user_answer.save
      # give the user some feedback
      sleep(1)
      if @user_answer.question != Question.last
        # move to next question
        @next_question = Question.where("id > ?", @user_answer.answer.question.id).first
        redirect_to question_path(@next_question)
      else
        console.log("fine")
        # submit > go to results
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
