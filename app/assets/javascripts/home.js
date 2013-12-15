$('.page-slides img:gt(0)').hide();

$(function(){
    $('.page-slides img:gt(0)').hide();
    setInterval(function(){
      $('.page-slides :first-child').fadeOut()
         .next('img').fadeIn()
         .end().appendTo('.page-slides');}, 
      6000);
});