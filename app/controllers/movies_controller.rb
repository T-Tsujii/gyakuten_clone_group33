class MoviesController < ApplicationController
  # 1ページの表示数
  PER_PAGE = 20
  def index
    if params[:genre].present?
      @q = Movie.where(genre: params[:genre]).ransack(params[:q])
      @movies = @q.result.page(params[:page]).per(PER_PAGE)
    else
      @q = Movie.where(genre: ["Basic", "Git", "Ruby", "Ruby on Rails"]).ransack(params[:q])
      @movies = @q.result.page(params[:page]).per(PER_PAGE)
    end
  end
end
