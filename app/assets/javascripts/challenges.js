$(document).on('turbolinks:load', function() {
  var starterCode = $('.code-area');
  var boilerplate = $('.boilerplate-area');

  if (starterCode.length == 0) return;

  var language;
  var languageMap = {
    'Java': 'text/x-java',
    'Python': 'python',
    'Ruby': 'ruby',
  };
  var starterCodeMirror = CodeMirror.fromTextArea(starterCode.get(0), {
    lineNumbers: true,
    indentUnit: 4,
    indentWithTabs: true,
  });

  var boilerplateMirror = CodeMirror.fromTextArea(boilerplate.get(0), {
    lineNumbers: true,
    indentUnit: 4,
    indentWithTabs: true,
  });

  if (boilerplate.attr('readonly') === undefined) {
    language = $('#challenge_language option:selected').text()
    $('#challenge_language').on('change', function() {
      language = $('#challenge_language option:selected').text();
      starterCodeMirror.setOption('mode', languageMap[language]);
      boilerplateMirror.setOption('mode', languageMap[language]);
    });
    bc = $('#challenge_boilerplate_code_raw').val();
    bc = bc.replace(new RegExp(/\\r\\n/, "gm"), "\r\n");
    bc = bc.replace(new RegExp(/\\t/, "gm"), "\t");
    bc = bc.replace(new RegExp(/\\\"/, "gm"), '"');
    boilerplateMirror.setOption('value', bc)

    sc = $('#challenge_starter_code_raw').val();
    sc = sc.replace(new RegExp(/\\r\\n/, "gm"), "\r\n");
    sc = sc.replace(new RegExp(/\\t/, "gm"), "\t");
    sc = sc.replace(new RegExp(/\\\"/, "gm"), '"');
    starterCodeMirror.setOption('value', sc)
  } else {
    language = $('#language').text();
    boilerplateMirror.setOption('readOnly', true);
  }
  starterCodeMirror.setOption('mode', languageMap[language]);
  boilerplateMirror.setOption('mode', languageMap[language]);
});
