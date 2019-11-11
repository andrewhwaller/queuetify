function loadPlaylists() {
  const response = await fetch(url);
  const playlistsJson = await response.json();
  console.log(JSON.stringify(playlistsJson))
}

document.onload = function() {
  loadPlaylists();
};