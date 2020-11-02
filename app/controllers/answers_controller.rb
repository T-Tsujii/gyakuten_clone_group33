class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)      
    end
    # current_user.answers.create!(question_id: params[:question_id])
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.answers.find_by(question_id: params[:question_id]).destroy!
    redirect_back(fallback_location: root_path)
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
