# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
	$(".search-input-box").change ->		
		$.get
			url: '/searchs'
			data: 'searchs='+$(this).val()		
			success: (data) ->
				$("#search_results").html(data)
			dataType: 'html'