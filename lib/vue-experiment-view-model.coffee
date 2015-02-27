{allowUnsafeNewFunction} = require 'loophole'
Vue = require 'vue'

module.exports =
class VueExperimentViewModel
  constructor: (@view, @model) ->
    @vue = allowUnsafeNewFunction =>
      new Vue
        el: @view
        data: @model
