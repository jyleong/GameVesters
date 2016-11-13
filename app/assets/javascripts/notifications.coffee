# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
    
@handleNotificationClick = (redirectTo, path) ->
    # Mark notification as read
    $.ajax path,
        type: 'PATCH'
        data: { notification: { read: true } }
    
    # Redirect to link
    window.location.href = redirectTo
    
$ ->
  $("a[data-redirect-to]").click (e) ->
    e.preventDefault()
 
    redirectTo = $(this).data("redirect-to")
    path = $(this).data("path")
    handleNotificationClick(redirectTo, path)
    