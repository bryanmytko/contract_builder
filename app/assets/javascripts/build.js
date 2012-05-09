$(document).ready(function(){
	
	$('.basic').click(function (e) {
		
		var tbl = $(this).parents('tr');
		var mod_name = tbl.find('p.name_text').html();
		var mod_hours = tbl.find('span.hours_text').html();
		var mod_cost = tbl.find('span.price_text').html();
		var mod_description = tbl.find('input.description').val();
		var mod_id = tbl.find('input.get_modification_id').val();
		var template_id = tbl.find('input.template_id').val();

		$('div#basic-modal-content input.mod_build_id').val(build_id);
		$('div#basic-modal-content input.mod_name').val(mod_name);
		$('div#basic-modal-content input.mod_cost').val(mod_cost);
		$('div#basic-modal-content input.mod_hours').val(mod_hours);
		$('div#basic-modal-content input.mod_id').val(mod_id);
		$('div#basic-modal-content textarea.mod_description').text(mod_description);
		$('div#basic-modal-content div#contact-container input.template_id').val(template_id);

		$('div#basic-modal-content').modal();
		
		return false;
		
	});
	
	$('.basic_cms').click(function(e){
		
		var tbl = $(this).parents('tr');
		var mod_name = tbl.find('p.name_text').html();
		var mod_hours = tbl.find('span.hours_text').html();
		var mod_cost = tbl.find('span.price_ecomm_text').html();
		var mod_description = tbl.find('input.description').val();
		var mod_id = tbl.find('input.get_modification_id').val();
		var template_id = tbl.find('input.template_id').val();
		var cms_type = tbl.find('input.cms_type').val();
		var feature_type = tbl.find('input.feature_type').val();

		$('div#basic-modal-content-pages input.mod_build_id').val(build_id);
		$('div#basic-modal-content-pages input.mod_name').val(mod_name);
		$('div#basic-modal-content-pages input.mod_cost').val(mod_cost);
		$('div#basic-modal-content-pages input.mod_hours').val(mod_hours);
		$('div#basic-modal-content-pages input.mod_id').val(mod_id);
		$('div#basic-modal-content-pages input.cms_type').val(cms_type);
		$('div#basic-modal-content-pages input.feature_type').val(feature_type);
		$('div#basic-modal-content-pages textarea.mod_description').text(mod_description);
		$('div#basic-modal-content-pages div#contact-container input.template_id').val(template_id);
		
		$('div#basic-modal-content-pages').modal();
		
		return false;
		
	});
	
});