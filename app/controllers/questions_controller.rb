class QuestionsController < ApplicationController

  before_action :set_question, only: %i[edit update destroy]

  def index
    @question = Question.new
    @questions = Question.order(id: :desc).includes(:user)
  end

  def show
    @question = Question.all
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
  end

  def new

  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to @question, notice: "質問を投稿しました"
    else
      @questions = Question.order(id: :desc).includes(:user)
      flash.now[:alert] = "投稿に失敗しました" 
      render :index
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: "質問を更新しました"      
    else
      flash.now[:alert] = "質問の更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @question.destroy!
    redirect_to @question, notice: "質問を削除しました"
  end

  private
  
  def question_params
    params.require(:question).permit(:title, :detail)
  end

  def set_question
    @question = current_user.questions.find(params[:id]) 
  end

end
