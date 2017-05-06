# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->	
	if $("#language").attr("locale")=="en"
		$("#language>span").prepend('<img src="http://res.cloudinary.com/kawaiipetto/image/upload/v1494029769/en_cv0qbq.png" width="50" height="30" />')
	if $("#language").attr("locale")=="ja"
		$("#language>span").prepend('<img src="http://res.cloudinary.com/kawaiipetto/image/upload/v1494029769/jp_bo0z77.jpg" width="50" height="30" />')
	if $("#language").attr("locale")=="vi"		
		$("#language>span").prepend('<img src="http://res.cloudinary.com/kawaiipetto/image/upload/v1494029770/vn_kkraxl.jpg" width="50" height="30" />')	
	$("#language li").click ->		
		$.post
			url: '/languages'
			data: 'locale='+$(this).attr("value")
			success: (result) ->				
				location.reload()
			dataType: "html"