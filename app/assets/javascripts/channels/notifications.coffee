App.notifications = App.cable.subscriptions.create "NotificationsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->  	
   tmp=$("#notifications").closest('li').find('span')
   if tmp.text()==""
    tmp.text('1')
    tmp.css('color', 'red')
   else
    tmp.text(parseInt(tmp.text())+1)
   $("#notifications").prepend(data.html)  