class QuestionsController < ApplicationController

  before_action :set_question, only: %i[edit update destroy]

  def index
    @question = Question.new
    @questions = Question.order(id: :desc).includes(:user)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
  end

  def create
    # @question = current_user.questions.create!(question_params)
    # redirect_to question, notice: "質問を投稿しました"
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
  end

  def update
    @question.update!(question_params)
    redirect_to @question, notice: "質問を更新しました"
  end

  def destroy
    @question.destroy!
    redirect_to root_path
  end

  private
  
  def question_params
    params.require(:question).permit(:title, :detail)
  end

  def set_question
    @question = current_user.questions.find_by(id: params[:id])  
    redirect_to root_path, alert: "権限がありません"
  end

end
