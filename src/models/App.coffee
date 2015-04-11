# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    # deck.add(new Card({rank: 10}))
    # deck.add(new Card({rank: 11}))
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

  endGame: ->
    #

