# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@handleQuantityChange = () ->
    new_price = $("#transaction_quantity").val() * stock_price
    $("#transaction_total_price").val(new_price.toFixed(2))

$ ->
    # Event handler for quantity field change
    $("#transaction-modal").on "change paste keyup", "#transaction_quantity", ->
        handleQuantityChange()
