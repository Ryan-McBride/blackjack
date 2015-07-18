# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @deal()
    @get('dealerHand').on 'end', => 
      @deal()
      @findWinner()



  findWinner: -> 
    if @get('dealerHand').scores() > @get('playerHand').scores() 
      alert "YOU LOSE FOOL." 
    else if this.get('dealerHand').scores() < this.get('playerHand').scores() 
      alert "YOU DIDN'T LOSE IDIOT."
    else alert "YOU BOTH LOST."

  deal: -> 
    @set 'playerHand', @get('deck').dealPlayer()
    @set 'dealerHand', @get('deck').dealDealer()