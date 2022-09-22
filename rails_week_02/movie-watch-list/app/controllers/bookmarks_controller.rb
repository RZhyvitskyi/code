class BookmarksController < ApplicationController
  before_action :get_movies, only: [:new]
  before_action :get_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new()
    @movie = Movie.find(bookmark_params[:movie_id])
    @bookmark.movie = @movie
    @bookmark.list = @list
    @bookmark.comment = bookmark_params[:comment]
    if @bookmark.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      redirect_to new_list_bookmark_path(@list)
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end

  def get_movies
    @movies = Movie.all
  end

  def get_list
    @list = List.find(params[:list_id])
  end
end
