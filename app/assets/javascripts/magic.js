$(document).ready(function(){

$('#dropdown').hide();

$('.thumbnails').click(showMenu);
$('.thumbnails').click(hideMenu);

function showMenu() {
  $(this).find("#dropdown").show(200)
}

function hideMenu() {
  $(this).find("#dropdown").hide()
}

// $(".thumbnails").click(loadSite);
//
// function loadSite() {
//   console.log('yo');
//     $(".thumbnails").append('<iframe id="frame" src="" height="350" width="700"></iframe>');
//     $("#frame").attr("src", "www.google.com");
//     }

});
