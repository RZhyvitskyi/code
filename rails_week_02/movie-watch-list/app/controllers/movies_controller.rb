class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @params = params

    if @params.has_key?(:list)
      @list = List.find(params[:list])
      @bookmark = Bookmark.new()
    end
  end
end
