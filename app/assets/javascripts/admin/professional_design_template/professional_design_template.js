$(document).ready(function(){
	
//	$('textarea.hidden_text_area').hide();
	
	$('a.add_desc').click(function(){
		
		$(this).parent().find('wysiwyg').toggle();
	//	$('textarea.hidden_text_area').hide();
	
	//	$(this).parent().find('.wysiwyg-template').wysiwyg('destroy');
		
		$(this).parent().find('.wysiwyg').wysiwyg({
			    controls: {
			        strikeThrough: { visible: true },
			        underline: { visible: true },
			        subscript: { visible: true },
			        superscript: { visible: true },
			    },
			 	//	css: '/js/jswysiwyg/jquery.wysiwyg.css',
					formHeight: 30,
				//	formWidth: 500,
					css: { padding: '10px 10px' },
					initialContent: ''

		});
		
	
		
	});

});