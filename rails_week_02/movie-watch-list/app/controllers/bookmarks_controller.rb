class BookmarksController < ApplicationController
  before_action :get_movies, only: [:new]
  before_action :get_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to @list, notice: 'Bookmark was successfully created.'
    else
      redirect_to new_list_bookmark_path(@list)
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
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
