class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    # @add last = @deck.pop(), console.log last
    @add(@deck.pop())
    if this.minScore() > 21 then alert 'You busted sucker!'
    # console.log 

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    maxScore = @minScore() + 10 * @hasAce()
    if maxScore > 21 then return @minScore()
    else return maxScore
     

  stand: ->
    @models[0].flip()
    @trigger 'end'
    # @model.set('dealerHand').flip()
