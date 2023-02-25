class BookmarksController < ApplicationController
  def new
    @list = List.find(params["list_id"])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params["list_id"])
    if Movie.where(name: bookmark_params[:movie]).empty?
      movie = Movie.create(name: bookmark_params[:movie], overview: bookmark_params[:comment])
    else
      movie = Movie.where(name: bookmark_params[:movie]).first
    end
    @bookmark = Bookmark.new(comment: bookmark_params[:comment])
    @bookmark.movie = movie
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie, :list_id)
  end
end
