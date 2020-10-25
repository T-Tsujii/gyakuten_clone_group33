class QuestionsController < ApplicationController
  def index
    @question = Question.new
  end

  def show
  end

  def new

  end

  def create
    question = Question.create!(question_params)
    redirect_to question
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
