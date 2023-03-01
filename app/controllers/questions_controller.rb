class QuestionsController < ApplicationController
  def show
    @question = all_questions.find(params[:id])
    @next_question = all_questions.where("id > ?", @question.id).first
    @previous_question = all_questions.where("id < ?", @question.id).last
    authorize @question
    @user_answer = UserAnswer.new
  end

  private
  def all_questions
    policy_scope(Question)
  end

end
