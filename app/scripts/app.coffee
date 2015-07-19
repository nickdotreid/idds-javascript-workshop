ace.config.set "basePath", "bower_components/ace-builds/src-noconflict"
$ ->
  console.log("DOM is ready")
  $('.editor').each (index, element) =>
    editor = ace.edit element
    editor.setTheme "ace/theme/chrome"
    editor.getSession().setMode "ace/mode/javascript"
    editor.setOptions maxLines:Infinity