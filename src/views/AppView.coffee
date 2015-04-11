class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <button class="replay-button blackjack">Replay</button> <h1 class="blackjack"></h1>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()
    'click .replay-button': -> @model.initialize()

  initialize: ->
    @render()
    @model.get('playerHand').on 'blackjack bust', (event) ->
      debugger
      @$el.find('h1').text(event)
    , @

    @model.get('playerHand').checkBlackJack()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

