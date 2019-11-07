function authenticateUser() {
  console.log('button was clicked')
  fetch('http://localhost:3000/users/auth/spotify')
  .then(resp => resp.html())
}

window.onload = function() {
  let spotifyButton = document.getElementById("spotifyLogin");
  spotifyButton.onclick = function() {
    authenticateUser()
  }
}