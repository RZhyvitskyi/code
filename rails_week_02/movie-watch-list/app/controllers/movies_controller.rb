class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :get_movie, only: [:show]
  before_action :get_reviews, only: [:show]

  def index
    @movies = Movie.all
  end

  def show
    @params = params

    if @params.has_key?(:list)
      @list = List.find(params[:list])
      @bookmark = Bookmark.new()
    end
  end

  private

  def get_movie
    @movie = Movie.find(params[:id])
  end

  def get_reviews
    @reviews = @movie.reviews
  end
end
