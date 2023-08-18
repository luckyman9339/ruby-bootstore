// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree

//= config.generators.javascript_engine = :js

const authToken = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0fQ.tSmFzc6luetFHxL0t0yVOtvPER4FlSvOSf4FHMqXQVU';
const container = document.querySelector(".container");

fetch('http://localhost:3000/api/books', {
  method: 'GET',
  headers: {
    'Authorization': `Bearer ${authToken}`
  }
})
.then(response => response.json())
.then(data => {
  console.log(data);

  const booksHtml = data.map(book => `
    <div class="book">
    <img src="${book.cover_image}" />
      <div class="book_info">
        <p>${book.title}</p>
        <p>${book.author}</p>
        <p>${book.description}</p>
        <p>${book.genre}</p>
      </div>
    </div>
  `).join('');

  container.innerHTML = booksHtml;
})
.catch(error => {
  // Handle errors
  console.error('Error:', error);
});
