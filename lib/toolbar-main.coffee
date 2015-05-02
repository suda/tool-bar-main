module.exports =
  activate: (state) ->

  deactivate: ->

  serialize: ->

  consumeToolBar: (toolbar) ->
    @toolbar = toolbar 'main-tool-bar'

    @toolbar.addButton
      icon: 'document'
      callback: 'application:new-file'
      tooltip: 'New File'
      iconset: 'ion'
    @toolbar.addButton
      icon: 'folder'
      callback: 'application:open-file'
      tooltip: 'Open...'
      iconset: 'ion'
    @toolbar.addButton
      icon: 'archive'
      callback: 'core:save'
      tooltip: 'Save'
      iconset: 'ion'

    @toolbar.addSpacer()

    @toolbar.addButton
      icon: 'search'
      callback: 'find-and-replace:show'
      tooltip: 'Find in Buffer'
      iconset: 'ion'
    @toolbar.addButton
      icon: 'shuffle'
      callback: 'find-and-replace:show-replace'
      tooltip: 'Replace in Buffer'
      iconset: 'ion'

    @toolbar.addSpacer()

    @toolbar.addButton
      icon: 'navicon-round'
      callback: 'command-palette:toggle'
      tooltip: 'Toggle Command Palette'
      iconset: 'ion'
    @toolbar.addButton
      icon: 'gear-a'
      callback: 'settings-view:open'
      tooltip: 'Open Settings View'
      iconset: 'ion'

    if atom.inDevMode()
      @toolbar.addSpacer()

      @toolbar.addButton
        icon: 'refresh'
        callback: 'window:reload'
        tooltip: 'Reload Window'
        iconset: 'ion'
      @toolbar.addButton
        icon: 'terminal'
        callback: ->
          require('remote').getCurrentWindow().toggleDevTools()
        tooltip: 'Toggle Developer Tools'
