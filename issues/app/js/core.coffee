jQuery ($) ->
	
	# save buttons to vars
	cancel = $('#cancel-btn')
	submit = $('#submit-btn')

	# init popovers
	$('input[name="title"]').tooltip({'placement':'top', 'trigger':'focus'})

	# handle canceling
	cancel.click ->
		window.close()
		false

	# clickable tables
	$('.issue').click ->
		document.location.href = this.getAttribute('href')