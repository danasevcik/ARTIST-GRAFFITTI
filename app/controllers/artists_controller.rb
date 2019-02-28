class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @graf_for_this_artist = Graffitti.where(artist_id: @artist.id)
  end

  def new
    @artist = Artist.new
  end

  def create
    artist = Artist.create(artist_params)
    if artist.valid?
      redirect_to artists_path
    else
      flash[:errors] = artist.errors.full_messages
      redirect_to new_artist_path
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    redirect_to artists_path
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.graffittis.destroy_all
    artist.destroy
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :hometown)
  end

end
