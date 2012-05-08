$(document).ready(function(){
	
	$('.basic').click(function (e) {
		
		var tbl = $(this).parents('tr');
		var mod_name = tbl.find('p.name_text').html();
		var mod_hours = tbl.find('span.hours_text').html();
		var mod_cost = tbl.find('span.price_text').html();
		var mod_description = tbl.find('input.description').val();
		var mod_id = tbl.find('input.get_modification_id').val();
		var template_id = tbl.find('input.template_id').val();

		$('input.mod_build_id').val(build_id);
		$('input.mod_name').val(mod_name);
		$('input.mod_cost').val(mod_cost);
		$('input.mod_hours').val(mod_hours);
		$('input.mod_id').val(mod_id);
		$('textarea.mod_description').text(mod_description);
		$('div#contact-container input.template_id').val(template_id);

		$('div#basic-modal-content').modal();
		
		return false;
		
	});
	
	$('.basic_cms').click(function(e){
		
		
		$('div#basic-modal-content-pages').modal();
		
		return false;
		
		
	});
	
});