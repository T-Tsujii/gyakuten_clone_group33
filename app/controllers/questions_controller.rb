class QuestionsController < ApplicationController

  before_action :set_question, only: %i[show edit update destroy]

  def index
    @question = Question.new
    @questions = Question.order(id: :desc)
  end

  def show

  end

  def create
    question = Question.create!(question_params)
    redirect_to question, notice: "質問を投稿しました"
  end

  private
  
  def set_question
    @question = Question.find(params[:id])  
  end

  def question_params
    params.require(:question).permit(:title, :detail)
  end
end
