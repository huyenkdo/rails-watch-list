class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:destroy]

  def new
    @bookmark = Bookmark.new
  end

  def create
    # @bookmark = Bookmark.new(bookmark_params)
    # @bookmark.movie =
    # @bookmark.list =
    # if @bookmark.save
    #   redirect_to list_path()
    # else

    # end
  end

  def destroy
    @bookmark.destroy

    redirect_to lists_path, status: :see_other
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
