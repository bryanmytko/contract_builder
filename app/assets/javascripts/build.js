$(document).ready(function(){
	
	$('.basic').click(function (e) {
		
		var tbl = $(this).parents('tr');
		var mod_name = tbl.find('p.name_text').html();
		var mod_hours = tbl.find('span.hours_text').html();
		var mod_cost = tbl.find('span.price_text').html();
		var mod_description = tbl.find('input.description').val();
		var design_id = tbl.find('input.get_design_id').val();
		var design_template_id = tbl.find('input.design_template_id').val();

		$('input.mod_build_id').val(build_id);
		$('input.mod_name').val(mod_name);
		$('input.mod_cost').val(mod_cost);
		$('input.mod_hours').val(mod_hours);
		$('input.design_id').val(design_id);
		$('textarea.mod_description').text(mod_description);
		$('input.design_template_id').val(design_template_id);
		$('input.design_id').val(design_id);

		$('div#basic-modal-content').modal();
		
		return false;
		
	});
	
});