class Api::V1::PlaylistsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_user

  def index
    playlists = @rspotify_user.playlists

    render json: playlists, status: 200
  end

  def show
    playlist = RSpotify::Playlist.find(current_user.uid, params[:id])

    render json: playlist, status: 200
  end

  def create
    playlist = @user.create_playlist!(playlist_name)

    render json: playlist, status: 200
  end 

  def update
    playlist = RSpotify::Playlist.find(current_user.uid, playlist_id)
    tracks = RSpotify::Track.search(search_term)
    playlist.add_tracks!(tracks)
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

  def set_user
    @rspotify_user = RSpotify::User.new(current_user.rspotify_user_hash)
  end
end
