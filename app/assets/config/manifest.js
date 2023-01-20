//= link_tree ../images
//= link_directory ../stylesheets .css
//= require jquery
//= link application.js
//= require angular-ujs
$.ajaxSetup({
  headers: {
    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  }
});
