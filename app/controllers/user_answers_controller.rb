class UserAnswersController < ApplicationController
  def index
  end

  def create
    @user_answer = UserAnswer.new(user_answer_params)
    @user_answer.user = current_user
    authorize @user_answer
    if !@user_answer.save
      render 'questions/show', status: :unprocessable_entity
    end
  end


  private

    # validates :start_date, presence: true
  def user_answer_params
    params.require(:user_answer).permit(:answer_id)
  end
end
