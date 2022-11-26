// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"
import "custom/trix-overrides"



$('action-text-attachment').on('click', function(e){
    e.preventDefault();
    var ul = $(this).attr('url');
    $('.presentation_image').css('background-image', "url(" + ul + ")");
    $('.presentation_image').addClass('open');
    $('body').addClass('ov-hidden');
});

$('.presentation_image').on('click', function(e){
    $(this).removeClass('open');
    $('body').removeClass('ov-hidden');
});

$(document).keyup(function(e) {
    if(e.key === "Escape"){
        $('.presentation_image').removeClass('open');
        $('body').removeClass('ov-hidden');
    }
});