class MoviesController < ApplicationController
  # 1ページの表示数
  PER_PAGE = 20

  def index
    if params[:genre].present?
      @movies = Movie.where(title: params[:genre]).page(params[:page]).per(PER_PAGE)
    else
      @movies = Movie.page(params[:page]).per(PER_PAGE)
    end
  end
end
