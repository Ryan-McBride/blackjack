# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @deal()
    @get('dealerHand').on 'end', => 
      @findWinner()



  findWinner: -> 
    if @get('dealerHand').scores() > @get('playerHand').scores() 
      console.log "YOU LOSE FOOL." 
    else if this.get('dealerHand').scores() < this.get('playerHand').scores() 
      console.log "YOU DIDN'T LOSE IDIOT."
    else console.log "YOU BOTH LOST."
    
    run = () =>
      @deal()
    setTimeout run, 2500

  deal: -> 
    @set 'playerHand', @get('deck').dealPlayer()
    @set 'dealerHand', @get('deck').dealDealer()
    @trigger 'refresh'
    @blackJackOrNah()

  blackJackOrNah : ->
    if @get('playerHand').scores() == 21 or @get('dealerHand').hiddenCardScore() == 20
      @findWinner()