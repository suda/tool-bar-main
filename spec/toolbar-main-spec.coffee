{WorkspaceView} = require 'atom'
ToolbarMain = require '../lib/toolbar-main'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "ToolbarMain", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('toolbar-main')

  describe "when the toolbar-main:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.toolbar-main')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'toolbar-main:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.toolbar-main')).toExist()
        atom.workspaceView.trigger 'toolbar-main:toggle'
        expect(atom.workspaceView.find('.toolbar-main')).not.toExist()
