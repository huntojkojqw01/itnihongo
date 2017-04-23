# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
	$("#pet_avatar").change ->		
		$(this).closest('div').find('label img').attr('src', window.URL.createObjectURL(this.files[0]))
	
	$("#view_photos,#view_albums").click ->		
		$("#show_photos").toggle();
		$("#show_albums").toggle();