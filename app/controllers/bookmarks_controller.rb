class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    raise
  end
end
