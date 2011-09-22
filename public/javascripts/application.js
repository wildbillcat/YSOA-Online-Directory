// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


function toggle_check() {
	var allCheck = document.getElementsByName('checkAll');
	var checkboxes = document.getElementsByName('user_ids[]');
	for(var i = 0; i<checkboxes.length; i++){
		checkboxes[i].checked = allCheck[0].checked;
	}
}

function selectAllCheckboxes() {
    $$('*[id^="user_ids_"]').invoke('writeAttribute', 'checked');
}

function toggle_visibility(id) {
	var e = document.getElementById(id);
	if(e.style.display == 'none')
		e.style.display = 'block';
	else
	e.style.display = 'none';
}


// code for new Rails3-compatible date selector - see http://asciicasts.com/episodes/213-calendars

$(function (){
    $('#search_graduation_date_eq').datepicker({dateFormat: 'dd-mm-yy'});  
});

$(function (){
    $('#search_created_at_gte').datepicker({dateFormat: 'dd-mm-yy'});  
});

$(function (){
    $('#search_created_at_lte').datepicker({dateFormat: 'dd-mm-yy'});  
});

$(function (){
    $('#transaction_due_date').datepicker({dateFormat: 'dd-mm-yy'});  
});



// code for ajax pagination from https://github.com/mislav/will_paginate/wiki/Ajax-pagination
// Need the jrails gem for this function to work properly!

$(document).ready(function(){
//document.observe("dom:loaded", function() {
  // the element in which we will observe all clicks and capture
  // ones originating from pagination links
  var container = $(document.body)

  if (container) {
    var img = new Image
    img.src = '/images/spinner.gif'

    function createSpinner() {
      return new Element('img', { src: img.src, 'class': 'spinner' })
    }

    container.observe('click', function(e) {
      var el = e.element()
      if (el.match('.pagination.ajax a')) {
	        el.up('.pagination.ajax').insert(createSpinner())
        new Ajax.Request(el.href, { method: 'get' })
        e.stop()
      }
    })
  }
})

// ajax pagination links

$('.pagination a').live('click',function (){  
        $.getScript(this.href);  
        return false;  
});

// Code for observing records_per_page
$('#per_page').live('change', function() {
/**
 * This way is designed to just rewrite the physical url and pass a string instead of attempting to use
 * jquery's get() function with 3 parameters, including an associative array. 
 */

/*
 * This section performs some string manupulation. It first grabs the current url from the window,
 * and then finds where the value of per_page begins and ends. It then takes the value in the dropdown
 * and replaces the old value in the URL string. 
 */
var url = window.location.href;
var perpage = url.indexOf('per_page');
if(perpage>0){
	var beginning = url.indexOf("=", perpage) + 1;
	var end = url.indexOf("&", beginning) - 1;
	if(end<beginning){
		url = url.substring(0, beginning);
		url = url + $('#per_page').val();
	}else{
		var part1 = url.substring(0, beginning);
		var part2 = url.substring(end, url.length);
		url = part1 + $('#per_page').val();
	}
}else{
	url = url + '&per_page=' + $('#per_page').val();
}

/*
 * This passes the URL WITH all of the parameters already concatenated in the string using the
 * load function from jquery. By appending the results tag, the load function will select just
 * the results div from the page, allowing for a quick replacement of results without a reload.
 */
	url = url + " #results";
	$('#results').load(url);

});


// $('#per_page').live('change', function() {
//	$.get('#users_path', { per_page: $('#per_page').val()}, function(data) {
//		$('#results').html(data);
//	});
// });

/*
 * This function is for the live validation of netIDs in the equipment checkout.
 * This is almost functional, the post request just needs to be alrighted to give the
 * server the correct parameter ID.
 */
$('#transaction_borrower_netid').live('change', function() {
// when the #transaction_borrower_netid field changes
// make a POST call and replace the content
	var netID = $('#transaction_borrower_netid').val();
	$.post("/live_validations/validate_borrower_netid", { borrower_netid: $('#transaction_borrower_netid').val() }, function(html) {
		$("#borrower_netid_message").html(html);
	});
}) 
