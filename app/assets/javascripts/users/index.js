// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

// create a User class
function User(username, first_name, last_name, email, posts) {
  this.username = username;
  this.first_name = first_name;
  this.last_name = last_name;
  this.email = email;
  this.posts = posts;
}
User.prototype.full_name = function() {
  return this.first_name + " " + this.last_name
}

$(function() {
  if ($('#users').length) {
    // fetch JSON from /users
    fetch("/users").then(
      function(response) { return response.json(); }
    ).then(
      // loop through JSON and create User objects
      function(json) {
        var users = json.map(function(obj) {
          return new User(obj["username"],
                          obj["first_name"],
                          obj["last_name"],
                          obj["email"],
                          obj["posts"])
        });
        return users
      }
    ).then(
      // loop through User objects and add them to the page using jQuery
      function(users) {
        for (index in users) {
          var user = users[index];
          $("#users").append(
                      "<ul>" + user.full_name() +
                      "<li>" + user.username + " has " +
                               user.posts.length + " posts" +
                      "</li>" + "</ul>" + "<br>")
        }
      }
    );
  }
});












//$(() => {
//  const userId = $('user').dataset.id
//  fetch(`/users/${userId}`).then(
