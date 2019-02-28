class GraffittisController < ApplicationController

  def index
    @graffittis = Graffitti.all
  end

  def show
    @graffitti = Graffitti.find(params[:id])
    @artist = Artist.find(@graffitti.artist_id)
  end

  def new
    @graffitti = Graffitti.new
  end

  def create
    graffitti = Graffitti.create(graffitti_params)
    redirect_to graffittis_path
  end

  def edit
    @graffitti = Graffitti.find(params[:id])
  end

  def update
    graffitti = Graffitti.find(params[:id])
    graffitti.update(graffitti_params)
    redirect_to graffittis_path
  end

  def destroy
    graffitti = Graffitti.find(params[:id])
    graffitti.destroy
    redirect_to graffittis_path
  end

  private

  def graffitti_params
    params.require(:graffitti).permit(:title, :description, :location, :artist_id)
  end

end
