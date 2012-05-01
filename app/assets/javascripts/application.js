// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function ucfirst(str) {
	var firstLetter = str.slice(0,1);
	return firstLetter.toUpperCase() + str.substring(1);
}

$(document).ready(function(){

$('a.add_desc').live('click',function(){
	$(this).parent().find('textarea').toggle();
});

$('a.cms_button').click(function(){
	var type = $(this).attr('id').split('_');
	type = type[1];
	title = ucfirst(type);
	$('h1#cms_selection_title').html(title);
	$('div#ecomm_buttons').hide();
	$('div#ecomm_change').show();
	$('div#' + type).fadeIn();
});

$('a#ecomm_change_link').click(function(){
	$('div#ecomm_buttons').show();
	$('div.cms_selection').hide();
	$('div#ecomm_change').hide();
	$('h1#cms_selection_title').html('Select your CMS:');
	$('input[type="checkbox"]').attr('checked', false)
	return false;
});

$('p.f_error').each(function(){
	
	$(this).prev().children('input').css({ 'border' : '1px solid #f00'})	
});

$('input').focus(function(){
	
	$(this).css({"border" : "none"});
	$(this).parent().next('p.f_error').fadeOut();
});



});
