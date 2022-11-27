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

$('.admin .admin_menu li').on('click', function(){
    if($(this).hasClass('current')){
        return false;
    }
    $('.admin .admin_menu li').removeClass('current');
    $(this).addClass('current');

    console.log($(this).attr('data-show'));

    $('.block').removeClass('current');
    $('.block#'+$(this).attr('data-show')).addClass('current');
});