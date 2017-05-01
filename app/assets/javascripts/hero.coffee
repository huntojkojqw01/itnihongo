$(document).on 'turbolinks:load', ->
	$('body').on 'click',  (e) ->
		if !$(e.target).is('#edit_delete_area textarea')							
			$("div#edit_delete_area").each (event) ->				
				if $(e.target).parent().find('#edit_delete_area')[0]!=$(this)[0]
					$(this).parent().find('p.comment-content').show()
					$(this).hide()
	$(".alert" ).fadeOut(5000)		
jQuery ->
	$.fn.modal_success = ()->        
        this.modal('hide')

        #clear form input elements
        #note: handle textarea, select, etc
        this.find('form input[type="text"]').val('')

        #clear error state
        this.clear_previous_errors()
   
	$.fn.render_form_errors = (errors) ->	    
	    this.clear_previous_errors()
	    model = this.data('model')

	    $.each(errors, (field, messages) ->	    	
	      	$input = $('input[name="' + model + '[' + field + ']"]')
	      	$input.closest('.form-group').addClass('has-error').find('.help-block').html( messages.join(' & ') )
	      	$select = $('select[name="' + model + '[' + field + ']"]')
	      	$select.closest('.form-group').addClass('has-error').find('.help-block').html( messages.join(' & ') )
	    )

 	$.fn.clear_previous_errors = () ->
	    $('.form-group.has-error', this).each( () ->
	      $('.help-block', $(this)).html('')
	      $(this).removeClass('has-error')
	    )	