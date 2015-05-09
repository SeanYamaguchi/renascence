// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require tag-it
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

$(document).scroll(function() {    
    var scroll = $(window).scrollTop();

    if (scroll <= 100) {
    	$(".header").removeClass("scrolingHeader");
    	$(".header").addClass("topHeader");
    } else {
    	$(".header").removeClass("topHeader");
        $(".header").addClass("scrolingHeader");
    }
});

$(document).scroll(function() {    
    var scroll = $(window).scrollTop();

    if (scroll <= 100) {
    	$(".head-link-1").removeClass("head-gradation-1");
    	$(".head-link-1").addClass("sc-purple");
    	$(".head-link-2").removeClass("head-gradation-2");
    	$(".head-link-2").addClass("sc-red");
    	$(".head-link-3").removeClass("head-gradation-3");
    	$(".head-link-3").addClass("sc-green");
    	$(".head-link-4").removeClass("head-gradation-4");
    	$(".head-link-4").addClass("sc-yellow");
     	$(".head-link-5").removeClass("head-gradation-5");
    	$(".head-link-5").addClass("sc-blue");
    	$(".head-link-6").removeClass("head-gradation-6");
    	$(".head-link-6").addClass("sc-swan");
    } else {
    	$(".head-link-1").removeClass("sc-purple");
        $(".head-link-1").addClass("head-gradation-1");
    	$(".head-link-2").removeClass("sc-red");
        $(".head-link-2").addClass("head-gradation-2");
    	$(".head-link-3").removeClass("sc-green");
        $(".head-link-3").addClass("head-gradation-3");
    	$(".head-link-4").removeClass("sc-yellow");
        $(".head-link-4").addClass("head-gradation-4");
    	$(".head-link-5").removeClass("sc-blue");
        $(".head-link-5").addClass("head-gradation-5");
    	$(".head-link-6").removeClass("sc-swan");
        $(".head-link-6").addClass("head-gradation-6");
    }
});