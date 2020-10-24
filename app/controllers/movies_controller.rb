class MoviesController < ApplicationController
  # 1ページの表示数
  PER_PAGE = 20
  def index
    @q=Movie.ransack(params[:q])
    @movies = @q.result.page(params[:page]).per(PER_PAGE)
  end
end
