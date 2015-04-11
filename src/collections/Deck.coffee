class window.Deck extends Backbone.Collection
  model: Card

  initialize: ->
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  dealPlayer: ->
    # hand = new Hand [@pop(), @pop()], @
    ace = new Card
      rank: 1
      suit: 1
    king = new Card
      rank: 10
      suit: 1
    hand = new Hand [ace, king], @
    # hand.checkBlackJack()
    hand

  dealDealer: -> new Hand [@pop().flip(), @pop()], @, true

