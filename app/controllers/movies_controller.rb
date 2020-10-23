class MoviesController < ApplicationController
  # 1ページの表示数
  PER_PAGE = 20
  def index
    @movies = Movie.page(params[:page]).per(PER_PAGE)
  end
end
