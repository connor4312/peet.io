$(document).ready ->
	# Set up nice scrolling for smooth awesomeness
	$('html').niceScroll { autohidemode: false }

	# Link up portofilio items correctly
	openSlider = (self, name) ->
		return false if $('#item').length

		$item = $('<div id="item"><div class="content"></div><div class="close"></div></div>')
		$('body').append $item

		$('.close', $item).on 'click', ->
			$('#item').fadeOut 200, -> @remove()

		$.get 'work/' + name + '/index.html', (data) ->
			$('.content', $item).html(data)
			$('td', $item).attr 'height', $(window).height() * 0.8

			$wrap = $('<div />').css
				'max-height': ($(window).height() * 0.8) + 'px'
				'overflow': 'hidden'
			$('td.bg', $item).wrapInner $wrap


	$('.work').each ->
		name = $(@).attr 'data-name'

		$(@).css 'background-image', 'url("work/' + name + '/thumb.jpg")'
		$(@).on 'click', (e) ->
			openSlider(@, name)
			e.preventDefault()
			return false


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

	# And now all the fancy scrollin stuff
	controller = $.superscrollorama
		triggerAtCenter: false
		playoutAnimations: false

	sh = $(window).height()

	controller.addTween(
		'#intro',
		TweenMax.fromTo($('#navbar'), 1,
			{ css: { background: 'rgba(0, 0, 0, 0)' }, immediateRender:true },
			{ css: { background: 'rgba(0, 0, 0, 1)' }}
		), sh * 0.25
	)
	controller.addTween(
		'#intro',
		TweenMax.fromTo($('#intro .sublime'), 1,
			{ css: { bottom: '-5px' }, immediateRender:true },
			{ css: { bottom: '-100px' }}
		), sh
	)

	# Smooth scroll on anchor link click

	$("a[href*=#]:not([href=#])").click (e)->
		if location.pathname.replace(/^\//, "") is @pathname.replace(/^\//, "") and location.hostname is @hostname
			target = $(@hash)
			target = (if target.length then target else $("[name=" + @hash.slice(1) + "]"))
			if target.length
				$("html,body").animate
					scrollTop: target.offset().top
				, 250, 'swing', => window.location.hash = @hash

			e.preventDefault()
			return false