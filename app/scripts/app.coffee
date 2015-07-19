ace.config.set "basePath", "bower_components/ace-builds/src-noconflict"
$ ->
  console.log("DOM is ready")
  $('.editor').each (index, element) =>
    editor = ace.edit $('pre', element)[0]
    editor.setTheme "ace/theme/chrome"
    editor.getSession().setMode "ace/mode/javascript"
    editor.setOptions maxLines:Infinity

    $('.run-btn', element).click ->
      console.log "Running..."
      canvas = $('body').append '<div class="turtleCanvas"><div id="turtle" class="turtle"></div></div>'
      $.turtle 'turtle'