# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
	$('#pet').change ->			
		$.get
			url: "/photos/new?pet_id="+$(this).val()
			success: (data) ->
				$("#photo_album_id").replaceWith $(data).find('#photo_album_id').clone()
			dataType: "html"
	$('#new_album').click ->
		$('#new_album_modal input[name="petname"]').val($("#pet option:selected").text())
		$('#new_album_modal #album_pet_id').val($("#pet").val())
		$('#new_album_modal').modal()		
	$("#photo_image").change ->		
		$('img').attr('src', window.URL.createObjectURL(this.files[0]))
	$("img.main-img").click ->
		window.location=$(this).attr("link")