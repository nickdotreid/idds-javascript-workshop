ace.config.set "basePath", "bower_components/ace-builds/src-noconflict"
$ ->
  console.log("DOM is ready")
  $('.editor').each (index, element) =>
    if element.id
      savedData = localStorage.getItem(element.id)
      $('pre', element).html(savedData) if savedData
    else
      $('.save-btn',element).prop 'disabled',true

    editor = ace.edit $('pre', element)[0]
    editor.setTheme "ace/theme/chrome"
    editor.getSession().setMode "ace/mode/javascript"
    editor.setOptions maxLines:Infinity

    $('.save-btn', element).click ->
      console.log "Saving"
      localStorage.setItem(element.id, editor.getValue())

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
      $('.backdrop-close').click (event) =>
        event.preventDefault()
        exit()
      turtle = $.turtle 'turtle'
      home()
      eval 'var turtle = $("#turtle")'
      eval editor.getValue()