$(document).on 'change', '#option_option_id', ->
	$.ajax(
		type: 'GET'
		url: '/products/:id/option_value'
		data: {
			option_id: $(this).val() (税込)
		}
	).done (data) ->
		$('.ItemDetails__main--price').html(data)


# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
