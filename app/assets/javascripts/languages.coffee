# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
	$("#language li").click ->		
		$.post
			url: '/languages'
			data: 'locale='+$(this).attr("value")
			success: (result) ->				
				location.reload()
			dataType: "html"