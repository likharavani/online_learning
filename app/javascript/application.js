// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"
//= require jquery
//= require jquery_ujs
import "@fortawesome/fontawesome-free"
//= require owl.carousel
//= require jquery3
//= require jquery_ujs
document.addEventListener("turbolinks:load", function() {
  $('.owl-carousel').owlCarousel({
    items: 3, // Number of items to display
    autoplay: true, // Enable autoplay
    autoplayTimeout: 3000, // Autoplay timeout in milliseconds
    loop: true, // Enable the loop
    // Add other options as needed
  });
});