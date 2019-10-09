class Api::V1::PlaylistsController < ApplicationController
  before_action :set_user

  def index
    playlists = @user.playlists

    render json: playlists, status: 200
  end

  def show
    playlist = RSpotify::Playlist.find(user_id, playlist_id)

    render json: playlist, status: 200
  end

  def create
    playlist = @user.create_playlist!(playlist_name)

    render json: playlist, status: 200
  end 

  def update
    playlist = RSpotify::Playlist.find(user_id, playlist_id)
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
    @user = RSpotify::User.new(request.env['omniauth.auth'])
  end
end
