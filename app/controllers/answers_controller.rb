class AnswersController < ApplicationController

  before_action :set_answer, only: %i[edit update destroy]

  def create
    @answer = current_user.answers.new(answer_params)
    if @answer.save
      flash[:notice] = "回答を投稿しました"
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = "回答の投稿に失敗しました"
      render "questions/show"
    end
  end

  def edit

  end

  def update
    @answer.update!(answer_params)
    redirect_to @answer, notice: "回答を更新しました"
  end

  def destroy
    current_user.answers.find_by(question_id: params[:question_id]).destroy!
    redirect_to @answer
  end

  private

  def answer_params
    params.require(:answer).permit(:content).merge params.permit(:question_id)
  end

  def set_answer
    @answer = current_user.answer.find(params[:id])  
  end
end
