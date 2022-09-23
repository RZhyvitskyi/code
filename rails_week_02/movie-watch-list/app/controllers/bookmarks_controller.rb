class BookmarksController < ApplicationController
  before_action :get_movies, only: [:new]
  before_action :get_list, only: [:new, :search]

  def new
    @bookmark = Bookmark.new
  end

  def search
    @movies = Movie.search_by_title(params[:title])
    @bookmark = Bookmark.new
    render :new
  end

  def create
    @list = List.find(params[:list_id])
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
    if params.has_key?(:bookmark)
      params.require(:bookmark).permit(:movie_id, :comment)
    else
      params.permit(:movie_id, :comment, :list_id)
    end
  end

  def get_movies
    get_list
    @movies = Movie.not_in_list(@list)
  end

  def get_list
    @list = List.find(params[:list_id])
  end
end
