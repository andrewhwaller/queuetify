class Api::V1::PlaylistsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    playlists = Playlist.all

    render json: playlists, status: 200
  end

  def show
    playlist = Playlist.find(params[:id])

    render json: playlist, status: 200
  end

  def create
    playlist = Playlist.create(playlist_params)

    render json: playlist, status: 200
  end 

  def update
    playlist = Playlist.find(params[:id])
    playlist.update(playlist_params)
    render json: playlist, status: 200
  end

  def destroy
    playlist = Playlist.find(params[:id])
    playlist.delete

    render json: {playlistId: playlist.id}
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end
    

end
