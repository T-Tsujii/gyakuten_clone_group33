class AwsTextsController < ApplicationController
  def index
    @aws_texts=AwsText.all
  end

  def show
    @aws_text=AwsText.
  end

end
