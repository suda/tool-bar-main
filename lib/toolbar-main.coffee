module.exports =
  activate: (state) ->
    atom.packages.activatePackage('toolbar')
      .then (pkg) =>
        @toolbar = pkg.mainModule

        @toolbar.appendSpacer()

        @toolbar.appendButton 'document', 'application:new-file', 'New File', 'ion'
        @toolbar.appendButton 'folder', 'application:open-file', 'Open...', 'ion'
        @toolbar.appendButton 'code-download', 'application:save', 'Save', 'ion'

        @toolbar.appendSpacer()

        @toolbar.appendButton 'search', 'find-and-replace:show', 'Find in Buffer', 'ion'
        @toolbar.appendButton 'shuffle', 'find-and-replace:show-replace', 'Replace in Buffer', 'ion'

        @toolbar.appendSpacer()

        @toolbar.appendButton 'navicon-round', 'command-palette:toggle', 'Toggle Command Palette', 'ion'
        @toolbar.appendButton 'gear-a', 'settings-view:open', 'Open Settings View', 'ion'

  deactivate: ->

  serialize: ->
