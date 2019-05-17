// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

// create a User class
function User(username, first_name, last_name, email) {
  this.username = username;
  this.first_name = first_name;
  this.last_name = last_name;
  this.email = email;
}
User.prototype.full_name = function() {
  return this.first_name + " " + this.last_name
}

$(function() {
  if ($('#users-list').length) {
    // fetch JSON from /users
    fetch("/users").then(
      function(response) { return response.json(); }
    ).then(
      // loop through JSON and create User objects
      function(json) {
        const users = json.map(function(obj) {
          return new User(obj["username"],
                          obj["first_name"],
                          obj["last_name"],
                          obj["email"])
        });
        return users
      }
    ).then(
      // loop through User objects and add them to the page using jQuery
      function(users) {
        for (index in users) {
          const user = users[index];
          $("#users-list").append("<li>" + user.full_name() + ", " + user.username + "</li>")
        }
      }
    );
  }
});
