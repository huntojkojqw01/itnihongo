# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
	$("#pet_avatar").change ->		
		$('img').attr('src', window.URL.createObjectURL(this.files[0]))