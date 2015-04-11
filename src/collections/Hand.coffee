class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    @on 'add', @checkBust, @

  hit: ->
    @add(@deck.pop())

  hasAce: ->
    @reduce (memo, card) ->
      memo or card.get('value') is 1
    , 0

  minScore: -> @reduce (score, card) ->
    debugger
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  bust: ->
    debugger
    @trigger 'bust', 'bust'

  blackjack: ->
    @trigger 'blackjack', 'blackjack'

  stand: ->
    @trigger 'stand'

  checkBust: ->
    # bust: if @scores[0] > 21 then invoke bust method
    @bust() if @scores()[0] > 21

  checkBlackJack: ->
    # blackjack: if @scores[1] === 21 && @length === 2, invoke blackjack method
    @blackjack() if @scores()[1] is 21
