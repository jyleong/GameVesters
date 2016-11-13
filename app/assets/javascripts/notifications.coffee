# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

REFRESH_INTERVAL = 10000

# Called when a notification is clicked
@handleNotificationClick = (redirectTo, path) ->
    # Mark notification as read
    $.ajax path,
        type: 'PATCH'
        data: { notification: { read: true } }
    
    # Redirect to link
    window.location.href = redirectTo

$ ->
    # Event handler for notification click
    $("a[data-redirect-to]").click (e) ->
        e.preventDefault()

        redirectTo = $(this).data("redirect-to")
        path = $(this).data("path")
        handleNotificationClick(redirectTo, path)

    # Refresh notifications per interval
    setInterval ->
        $('.notification-list').load('/refresh_notifications');
    , REFRESH_INTERVAL
