$(document).ready(function(){

	/* When "add to archive button" is clicked, fade out and call add_to_archive() method in ajax.php Controller */
	/*$('a.dashboard_archive').live('click',function(){
	
	    var type = $('div#dashboard').find('a:not(.dim)').attr('id');

		var id = $(this).attr('id').split('_');
		var thisRecord = $(this).parent().parent('tr');

	    $.ajax({
			url: '/ajax/add_to_archive/' + id[1],
			type: 'post',
			data: 'type=' + type,
			success: function(html){

				thisRecord.fadeOut();

			}

		});

		return false;

	});*/
	
	$('a.dim').live('click',function(){

	    $('div#dashboard > a').each(function(){ $(this).addClass('dim'); });
	   
	    $(this).removeClass('dim');
	    
        var dash = $(this).attr('id');
        dash = dash.split('_');
        dash = dash[1];
	    
	    $('div.dashboard_data_container').each(function(){$(this).hide()});

	    $('div.dashboard_' + dash).show();
	    
	    return false;
	    
	});

});
