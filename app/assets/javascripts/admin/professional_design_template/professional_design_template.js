$(document).ready(function(){

	$('.wysiwyg-template').wysiwyg({
		 controls: {
		     strikeThrough: { visible: true },
		     underline: { visible: true },
		     subscript: { visible: true },
		     superscript: { visible: true },
		 },
		css: '/js/jswysiwyg/jquery.wysiwyg.css',
		formHeight: 30,
		formWidth: 500,
		css: { padding: '10px 10px' },
		initialContent: ''

	});

});