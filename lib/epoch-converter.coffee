module.exports =
  activate: ->
    atom.commands.add 'atom-text-editor', 'epoch-converter:UTC', -> @convert("utc")
    atom.commands.add 'atom-text-editor', 'epoch-converter:UTC-replace', -> @convert('utc-replace')
    atom.commands.add 'atom-text-editor', 'epoch-converter:date-string', -> @convert('date-string')
    atom.commands.add 'atom-text-editor', 'epoch-converter:date-string-replace', -> @convert('date-string-replace')
    atom.commands.add 'atom-text-editor', 'epoch-converter:ISO', -> @convert('iso')
    atom.commands.add 'atom-text-editor', 'epoch-converter:ISO-replace', -> @convert('iso-replace')

  isNumber: (n) ->
    return !isNaN(parseFloat(n)) && isFinite(n);

  convert: (mode) ->
    selection = atom.workspace.getActivePaneItem().getLastSelection().getText()
    editor = atom.workspace.getActiveTextEditor()

    # Get all selections
    selections = atom.workspace.getActivePaneItem().getSelections()

    epoch = 0
    d = []

    # Create the epoch
    for selection in selections
      if @isNumber(selection) is true
        epoch = parseInt(selection)
        d = new Date(0)
        d.setUTCSeconds(epoch)


    if mode == "utc"
      atom.notifications.addInfo(d.toUTCString())
    else if mode == "utc-replace"
      for selection in selections
        selection.insertText("\'" + d.toUTCString() + "\'")
    else if mode == "date-string"
      atom.notifications.addInfo(d.toDateString())
    else if mode == "date-string-replace"
      for selection in selections
        selection.insertText("\'" + d.toDateString() + "\'")
    else if mode == "iso"
      atom.notifications.addInfo(d.toISOString())
    else if mode == "iso-replace"
      for selection in selections
        selection.insertText("\'" + d.toISOString() + "\'")
