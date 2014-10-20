module.exports =
  activate: (state) ->
    atom.packages.activatePackage('toolbar')
      .then (pkg) =>
        @toolbar = pkg.mainModule

        @toolbar.appendButton 'file-code', 'application:new-file', 'New File'
        @toolbar.appendButton 'file-directory', 'application:open-file', 'Open...'
        @toolbar.appendButton 'cloud-download', 'application:save', 'Save'

        @toolbar.appendSpacer()

        @toolbar.appendButton 'search', 'find-and-replace:show', 'Find in Buffer'
        @toolbar.appendButton 'git-compare', 'find-and-replace:show-replace', 'Replace in Buffer'

        @toolbar.appendSpacer()

        @toolbar.appendButton 'book', 'command-palette:toggle', 'Toggle Command Palette'
        @toolbar.appendButton 'gear', 'settings-view:open', 'Open Settings View'

  deactivate: ->

  serialize: ->
