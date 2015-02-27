module.exports =
class VueExperimentModel
  constructor: ->
    @buttonMessage = 'Clicked'
    @clicks = 0
    @things = [
      {name: 'one'}
      {name: 'two'}
      {name: 'three'}
      {name: 'four'}
    ]
