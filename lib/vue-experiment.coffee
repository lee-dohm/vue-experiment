{CompositeDisposable} = require 'atom'

VueExperimentModel = require './vue-experiment-model'
VueExperimentView = require './vue-experiment-view'
VueExperimentViewModel = require './vue-experiment-view-model'

module.exports = VueExperiment =
  vueExperimentView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @model = new VueExperimentModel
    @view = new VueExperimentView
    @viewModel = new VueExperimentViewModel(@view.getElement(), @model)
    @modalPanel = atom.workspace.addModalPanel(item: @viewModel.$el, visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'vue-experiment:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()

  toggle: ->
    console.log 'VueExperiment was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()


  #   @vueExperimentView = new VueExperimentView(state.vueExperimentViewState)
  #   @modalPanel = atom.workspace.addModalPanel(item: @vueExperimentView.getElement(), visible: false)
  #
  #   # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
  #   @subscriptions = new CompositeDisposable
  #
  #   # Register command that toggles this view
  #   @subscriptions.add atom.commands.add 'atom-workspace', 'vue-experiment:toggle': => @toggle()
  #
  # deactivate: ->
  #   @modalPanel.destroy()
  #   @subscriptions.dispose()
  #   @vueExperimentView.destroy()
  #
  # serialize: ->
  #   vueExperimentViewState: @vueExperimentView.serialize()
  #
  # toggle: ->
  #   console.log 'VueExperiment was toggled!'
  #
  #   if @modalPanel.isVisible()
  #     @modalPanel.hide()
  #   else
  #     @modalPanel.show()
