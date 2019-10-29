App.cable.subscriptions.create('ProductsChannel', {
  connected: ->
    console.log("Viva!")
    @follow()

  follow: ->
    @perform 'follow'

  received: (data) ->
    $(".list").replaceWith data
})
