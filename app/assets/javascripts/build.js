$(document).ready(function(){
	
	$('.basic').click(function (e) {
		
			var tbl = $(this).parents('tr');
			console.log(tbl.html());

			var mod_name = tbl.find('input.hours').attr('name');
			var mod_hours = tbl.find('span.hours_text').html();
			var mod_cost = tbl.find('span.price_text').html();
			var mod_description = tbl.find('input.description').val();
			
			var build_id = $('input#build_id').val();

			mod_name = mod_name.split('design_');
			mod_name = mod_name[1].split('_hours');
			mod_name = mod_name[0].replace('_', ' ');

			$('input.mod_build_id').val(build_id);
			$('input.mod_name').val(mod_name);
			$('input.mod_cost').val(mod_cost);
			$('input.mod_hours').val(mod_hours);
			$('textarea.mod_description').text(mod_description);


		$('#basic-modal-content').modal();

		return false;
		
	});
	
});