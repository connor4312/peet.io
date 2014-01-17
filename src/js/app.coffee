$(document).ready ->
	$('html').niceScroll { autohidemode: false }

	$('.work').each ->
		$(@).css 'background-image', 'url("work/' + $(@).attr('data-name') + '/thumb.jpg")'