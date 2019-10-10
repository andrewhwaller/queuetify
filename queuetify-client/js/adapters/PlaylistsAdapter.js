class PlaylistsAdapter {
  constructor() {
    this.baseUrl = 'http://localhost:3000/api/v1/playlists'
  }

  getPlaylists() {
    return fetch(this.baseUrl).then(res => res.json()
    )
  }
}

// adapter = new PlaylistsAdapter()

// const playlists = adapter.getPlaylists()