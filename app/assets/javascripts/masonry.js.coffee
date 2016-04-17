$ ->
	$('#masonry-container').imagesLoaded ->
		$('#masonry-container').masonry
			itemSelector: '.grid-item',
			gutterWidth: 0,
			isAnimated: true,
			isFitWidth: true,
			animationOptions: {
				duration: 1000,
				easing: 'swing'
			}
$ ->
	$('.skills_list').click ->
		$('.Work').show()
		$('.Experience').hide()
		$('.Product').hide()
		$('.Hobby').hide()
$ ->
	$('.experiences_list').click ->
		$('.Work').hide()
		$('.Experience').show()
		$('.Product').hide()
		$('.Hobby').hide()
$ ->
	$('.products_list').click ->
		$('.Work').hide()
		$('.Experience').hide()
		$('.Product').show()
		$('.Hobby').hide()
$ ->
	$('.hobbies_list').click ->
		$('.Work').hide()
		$('.Experience').hide()
		$('.Product').hide()
		$('.Hobby').show()
$ ->
	$('.portofolios_list').click ->
		$('.Work').show()
		$('.Experience').show()
		$('.Product').show()
		$('.Hobby').show()
