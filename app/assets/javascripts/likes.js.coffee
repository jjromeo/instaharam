# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

	$('.likes-link').on 'click', (event)->
		likesCount = $(@).siblings('.likes-count')
		event.preventDefault()
		$.post @href, (response) ->
			likesCount.text(response.new_like_count)