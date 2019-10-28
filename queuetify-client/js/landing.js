function authenticateUser() {
  console.log('button was clicked')
  fetch('http://localhost:3000/users/auth/spotify', {
    mode: "no-cors"
  })
  .then(resp => resp.json())
  .then(json => console.log(json));
}

window.onload = function() {
  let spotifyButton = document.getElementById("spotifyLogin");
  spotifyButton.onclick = function() {
    authenticateUser()
  }
}