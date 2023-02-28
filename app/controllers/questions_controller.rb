class QuestionsController < ApplicationController
  def show
    @question = all_questions.find(params[:id])
    authorize @question
  end

  private
  def all_questions
    policy_scope(Question)
  end

end
