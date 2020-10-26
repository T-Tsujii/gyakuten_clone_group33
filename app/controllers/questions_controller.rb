class QuestionsController < ApplicationController
  def index
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    question = Question.create!(question_params)
    redirect_to question, notice: "質問を投稿しました"
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  
  def question_params
    params.require(:question).permit(:title, :detail)
  end
end
