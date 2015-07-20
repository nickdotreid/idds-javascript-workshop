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
      $('samp').show();
      exit = ->
        cg();
        $('samp').hide();
        canvas.remove();
      $(document).keyup (e) =>
        return if e.keyCode != 27
        exit()
      canvas = $('<a class="close-btn btn backdrop-close">Close</a><div class="backdrop backdrop-turtle"><div id="turtle" class="turtle"></div></div>').appendTo 'body'
      $('.close', canvas).click (event) =>
        event.preventDefault()
        exit()
      turtle = $.turtle 'turtle'
      home()
      eval 'var turtle = $("#turtle")'
      eval editor.getValue()