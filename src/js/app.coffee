$(document).ready ->
	# Set up nice scrolling for smooth awesomeness
	$('html').niceScroll { autohidemode: false }

	# Link up portofilio items correctly
	$('.work').each ->
		$(@).css 'background-image', 'url("work/' + $(@).attr('data-name') + '/thumb.jpg")'

	# Create the testimonial slider and bind navigation
	$testimonial = $('#testimonial')
	$contents = $('.contents li', $testimonial)
	$navarea = $('.nav', $testimonial)
	
	for content, index in $contents
		$navarea.append $('<li data-num="' + (index + 1) + '">')
		$(content).wrapInner $('<div class="verticalTable"><div class="verticalCell"></div></div>')

	do setActive = (index = 1) ->
		$('li', $navarea)
			.add($contents)
			.removeClass('active')
			.filter(':nth-child(' + index + ')')
			.addClass('active')

	$('li', $navarea).click -> setActive $(@).attr('data-num')