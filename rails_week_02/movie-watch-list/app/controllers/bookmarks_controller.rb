class BookmarksController < ApplicationController
  before_action :get_movies, only: [:new]

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new()
    @movie = Movie.find(bookmark_params[:movie_id])
    @bookmark.movie = @movie
    @bookmark.list = @list
    @bookmark.comment = bookmark_params[:comment]
    if @bookmark.save
      redirect_to new_list_bookmark_path(@list), notice: 'List was successfully created.'
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

  def get_user
    @user = current_user
  end

  def get_list
    @list = List.find(params[:id])
  end
end
