class AlbumsController < ApplicationController
  load_and_authorize_resource
  respond_to :html
  def index
    @albums = Album.where(user: current_user)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @album = current_user.albums.create!(album_params)
    respond_with(@album)
  end

  def update
    @album.update(album_params)
    respond_with(@album)
  end

  def destroy
    @album.destroy
    respond_with(@album)
  end

  private

  def album_params
    params.require(:album).permit(:title, :description)
  end
end
