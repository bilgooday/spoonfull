$(document).ready(function(){

$('#dropdown').hide();
$('#mobile-menu').hide();

$('.thumbnails').click(showMenu);
$('.thumbnails').click(hideMenu);
$('.menu-icon').click(show_mobile_Menu);
// $('.thumbnails').click(loadSite);


function showMenu() {
  $(this).find("#dropdown").show(250);
}

function hideMenu() {
  $(this).find("#dropdown").hide();
}

function show_mobile_Menu() {
  $('#mobile-menu').show();
}

// $(".thumbnails").click(loadSite);
//
// function loadSite() {
//   console.log('yo');
//
//     // $("#frame").load("www.google.com");
//     $("#frame").attr("src", "www.google.com");
//     }

});
