# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
	$("#pet_avatar").change ->		
		$(this).closest('div').find('label img').attr('src', window.URL.createObjectURL(this.files[0]))
	
	$("#view_photos").click ->	
		$("#view_photos").attr("disabled",true);	
		$("#show_photos").show();
		$("#view_albums").attr("disabled",false);
		$("#show_albums").hide();
	$("#view_albums").click ->
		$("#view_photos").attr("disabled",false);		
		$("#show_photos").hide();
		$("#view_albums").attr("disabled",true);
		$("#show_albums").show();