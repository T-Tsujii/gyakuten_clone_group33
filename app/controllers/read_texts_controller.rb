class ReadTextsController < ApplicationController
  def create
    @aws_text = AwsText.find(params[:aws_text_id])
    current_user.read_texts.create!(aws_text_id: @aws_text.id)
  end

  def destroy
    @aws_text = AwsText.find(params[:aws_text_id])
    current_user.read_texts.find_by(aws_text_id: @aws_text.id).destroy!
  end
end
