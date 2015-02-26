Vue = require 'vue'

module.exports =
class VueExperimentViewModel
  constructor: (@view, @model) ->
    @vue = new Vue
      el: @view
      data: @model
