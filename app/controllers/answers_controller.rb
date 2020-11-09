class AnswersController < ApplicationController

  before_action :set_answer, only: %i[edit update destroy]

  def create
    @answer = current_user.answers.create!(question_id: params[:question_id], content: [answer_params])
    redirect_back(fallback_location: root_path)
  end

  def edit

  end

  def update
    @answer.update!(answer_params)
    redirect_to @answer, notice: "質問を更新しました"
  end

  def destroy
    current_user.answers.find_by(question_id: params[:question_id]).destroy!
    redirect_back(fallback_location: root_path)
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

  def set_answer
    @answer = current_user.answer.find(params[:id])  
  end
end
