# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
	$("p.comment-content").click ->
		tmp=$(this).closest('div').find('#edit_delete_area')
		if (tmp.length>0)
			tmp.show()
			$(this).hide()
		