module.exports =
  activate: (state) ->
    atom.packages.activatePackage('toolbar')
      .then (pkg) =>
        @toolbar = pkg.mainModule

        @toolbar.appendButton 'document', 'application:new-file', 'New File', 'ion'
        @toolbar.appendButton 'folder', 'application:open-file', 'Open...', 'ion'
        @toolbar.appendButton 'archive', 'core:save', 'Save', 'ion'

        @toolbar.appendSpacer()

        @toolbar.appendButton 'search', 'find-and-replace:show', 'Find in Buffer', 'ion'
        @toolbar.appendButton 'shuffle', 'find-and-replace:show-replace', 'Replace in Buffer', 'ion'

        @toolbar.appendSpacer()

        @toolbar.appendButton 'navicon-round', 'command-palette:toggle', 'Toggle Command Palette', 'ion'
        @toolbar.appendButton 'gear-a', 'settings-view:open', 'Open Settings View', 'ion'

        if atom.inDevMode()
          @toolbar.appendSpacer()

          @toolbar.appendButton 'refresh', 'window:reload', 'Reload Window', 'ion'
          @toolbar.appendButton 'terminal', ->
            require('remote').getCurrentWindow().toggleDevTools()
          , 'Toggle Developer Tools'

  deactivate: ->

  serialize: ->
