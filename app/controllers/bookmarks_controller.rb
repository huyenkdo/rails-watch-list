class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:destroy]

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @movies = Movie.all.map(&:title)
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    movies_title = params[:bookmark]['movie_id']
    movie = Movie.where(title: movies_title)
    @bookmark.movie_id = movie[0].id
    @bookmark.list_id = params[:list_id]
    save_bookmark
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end

  def save_bookmark
    @list = List.find(params[:list_id])
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
