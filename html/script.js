$(document).ready( function() {
	$('.nav li').hover( function() {
		$('ul', this).fadeIn();
	}, function() {
		$('ul', this).fadeOut();
	} );
	$('#display').load( 'home.html' );
	$('.links').click(function(e){
     e.preventDefault();
     $("#display").load($(this).attr('href'));
  	});
});
