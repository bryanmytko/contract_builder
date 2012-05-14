var buildObj = {a:true};

$(document).ready(function(){
	
	var hourly_Rate = 0;

	buildObj.init = function(){
		hourly_rate = $('input#build_hourly_rate').val();
		display_prices();
		display_sums();
		console.log(hourly_rate);
	}
	
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
	
	/** Calculations **/
	
	$('input.hours').keydown(function(event){
		numOnly(event);
	});
	
	/* Totals counters */
	var design_total = 0;
	var frontend_total = 0;
	var cms_total = 0;
	var planning_total = 0;
	var qa_total = 0;
	var pm_total = 0;
	var sub_total = 0;
	var grand_total = 0;
	
	/* User inputs */
	var input_design_hours = $('input.design_hours');
	var input_frontend_hours = $('input.frontend_hours');
	
	/* Display outputs */
	var design_total_display_hours = $('span.sidebar_design_hours_text');
	var design_total_display_price = $('span.sidebar_design_price_text');
	var frontend_total_display_hours = $('span.sidebar_coding_hours_text');
	var frontend_total_display_price = $('span.sidebar_coding_price_text');
	var cms_total_display_hours = $('span.sidebar_features_hours_text');
	var cms_total_display_price = $('span.sidebar_features_price_text');
	
	/* Coefficents */
	var pm_coeff = 0.05;
	var qa_coeff = 0.05;
	var planning_coeff = 0.1;
	
	$('input').focus(function(){
		if($(this).val() == '0') $(this).val('');
	});
	
	input_design_hours.keyup(function(event){	
		var tbl = $(this).parents('tr');
		var price_text = tbl.find('span.price_text');		
		this_hours = parseFloat(tbl.find('span.hours_text').html());		
		this_quantity = parseFloat($(this).val());
		if(!isNaN(this_quantity)) price_text.html((this_hours * this_quantity * hourly_rate));
		else price_text.html('0');
		display_sums();	
	});
	
	input_frontend_hours.keyup(function(event){
		var tbl = $(this).parents('tr');
		var price_text = tbl.find('span.price_text');
		this_hours = parseFloat(tbl.find('span.hours_text').html());
		this_quantity = parseFloat($(this).val());
		if(!isNaN(this_quantity)) price_text.html((this_hours * this_quantity * hourly_rate));
		else price_text.html('0');
		display_sums();	
	});
	
	var cms_table = $('div.cms_selection').not('.cms_selection_hidden');
	var cms_inputs = cms_table.find('input');
	
	cms_inputs.change(function(){
		display_sums();
	});
	
	function display_sums(){
		
		console.log('displaying sums!');
		
		/* Design Totals */
		design_ptotal = 0;
		design_htotal = 0;
		$('span.design_price_text').each(function(){	
			var val = parseInt($(this).html());
			if(!isNaN(val)){
				design_ptotal += val;
			}
		});
		$('span.design_hours_text').each(function(){
			var val = parseInt($(this).html());
			var q = $(this).parents('tr').find('input.design_hours').val();
			if(!isNaN(val)){
				design_htotal += val * q;
			}	
		});
		/* Front End Totals */
		frontend_ptotal = 0;
		frontend_htotal = 0;
		$('span.frontend_price_text').each(function(){
			var val = parseInt($(this).html());
			if(!isNaN(val)){
				frontend_ptotal += val;
			}
		});
		$('span.frontend_hours_text').each(function(){
			var val = parseInt($(this).html());
			var q = $(this).parents('tr').find('input.frontend_hours').val();
			if(!isNaN(val)){
				frontend_htotal += val * q;
			}
		});
		
		/* CMS Totals */
		cms_ptotal = 0;
		cms_htotal = 0;
		cms_inputs.each(function(){
			if ($(this).is(':checked')) {
				var h = parseInt($(this).parents('tr').find('span.cms_hours_text').html());
				var p = parseInt($(this).parents('tr').find('span.cms_price_text').html());
				if(!isNaN(h)) cms_htotal += h;
				if(!isNaN(p)) cms_ptotal += p;
			}
		});
		
		design_total_display_price.html(design_ptotal);
		design_total_display_hours.html(design_htotal);
		frontend_total_display_price.html(frontend_ptotal);
		frontend_total_display_hours.html(frontend_htotal);
		cms_total_display_hours.html(cms_htotal);
		cms_total_display_price.html(cms_ptotal);
		
		var sub_total_hours = design_htotal + frontend_htotal + cms_htotal;

		var qa_total_hours = Math.ceil(sub_total_hours*qa_coeff);
		var pm_total_hours = Math.ceil(sub_total_hours*pm_coeff);
		var planning_total_hours = Math.ceil(sub_total_hours*planning_coeff);
		
		$('span.sidebar_planning_hours_text').html(planning_total_hours);
		$('span.sidebar_pm_hours_text').html(pm_total_hours);
		$('span.sidebar_qa_hours_text').html(qa_total_hours);
		
		$('span.sidebar_planning_price_text').html(planning_total_hours*hourly_rate);
		$('span.sidebar_pm_price_text').html(pm_total_hours*hourly_rate);
		$('span.sidebar_qa_price_text').html(qa_total_hours*hourly_rate);
	
		grand_total_hours = sub_total_hours + qa_total_hours + pm_total_hours + planning_total_hours;
		grand_total_price = ((design_htotal + frontend_htotal + pm_total_hours + qa_total_hours + planning_total_hours) * hourly_rate) + cms_ptotal;

		$('span.sidebar_grand_hours_text').html(grand_total_hours);
		$('span.sidebar_grand_price_text').html(grand_total_price);
		
	}
	
	function display_prices(){
		
		$('input.hours').each(function(){
			var tbl = $(this).parents('tr');
			if($(this).val() != 0){
				var hours = tbl.find('span.hours_text').html();
				tbl.find('span.price_text').html($(this).val() * hourly_rate * hours);
			}
		});
	}

	/************************ UTILITY FUNCTIONS ******************************************
	*************************************************************************************/

	//prevent non-number input via keyboard
	function numOnly(event){

	    //allow: backspace, delete, tab and escape
	    if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || 
	         //allow: Ctrl+A
	        (event.keyCode == 65 && event.ctrlKey === true) || 
	         //allow: home, end, left, right
	        (event.keyCode >= 35 && event.keyCode <= 39)){
	             //let it happen, don't do anything
	             return true;
	    }
	    else if (event.ctrlKey || event.shiftKey) {
	        //non IE
	        event.preventDefault();
	    }
	    else {
	        //ensure that it is a number and stop the keypress
	        if ((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105 )) {
	            event.preventDefault(); 
	        }   
	    }
	}

	//Format names to have each word capitalized
	function format_name(n){
		return n.replace(/_/gi,' ').replace(/\b\w/g, function (c) { return c.toUpperCase(); });
	}

	//Format numbers to US currency format
	function format_number(num){
		num += '';
		x = num.split('.');
		x1 = x[0];
		x2 = x.length > 1 ? '.' + x[1] : '';
		var rgx = /(\d+)(\d{3})/;
		while (rgx.test(x1)) {
			x1 = x1.replace(rgx, '$1' + ',' + '$2');
		}
		return x1 + x2;
	}

	/**************************************************************************************
	**************************************************************************************/

	buildObj.init();//Fire it up*/

	
});//end document.ready();