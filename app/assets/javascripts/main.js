$(function(){
    var hidden = 0;
    $('body').on('mousewheel', function(event) {
        if ( ($(document).scrollTop() == 0) && hidden ){
          hidden = 0;
              $('.navibar').animate({'font-size':'1em','height': '80px'}, 'fast');
              $('.navibar li').animate({ marginTop: 10, paddingTop: 10,paddingBottom: 10}, 'fast');
              $('.image-logo').animate({width: 40, height: 40}, 'fast');
                }
        if ((!hidden) && ($(document).scrollTop() != 0)){
            $('.navibar').animate({'font-size':'0.7em', 'height': '40px'}, 'fast');
            $('.navibar li').animate({ marginTop: 5, paddingTop: 0, paddingBottom: 0}, 'fast');
            $('.image-logo').animate({width: 30, height: 30}, 'fast');
            event.preventDefault();
            event.stopPropagation();
            hidden=1;
            return;
        }
    });
})