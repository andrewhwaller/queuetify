require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV["spotify_client_id"], ENV["spotify_client_secret"], scope: 'playlist-read-collaborative playlist-modify-private playlist-modify-public playlist-read-private user-read-private user-read-email user-modify-playback-state user-read-playback-state user-read-currently-playing user-read-recently-played user-top-read streaming app-remote-control'
end