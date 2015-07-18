# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('dealerHand').on 'end', => @findWinner()

  findWinner: -> 
  	winner = alert 'YOU BOTH LOST'
  	if @get('dealerHand').scores() > @get('playerHand').scores() 
  		winner = alert "YOU LOSE FOOL." 
  	else if @get('dealerHand').scores() < @get('playerHand').scores() 
  		winner = alert "YOU DIDN'T LOSE IDIOT."
  	return winner