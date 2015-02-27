fs = require 'fs'
path = require 'path'

module.exports =
class VueExperimentView
  constructor: ->
    @element = document.createElement('div')
    @element.classList.add('vue-experiment')
    @element.innerHTML = fs.readFileSync(path.join(__dirname, '../templates/view.html'))

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
