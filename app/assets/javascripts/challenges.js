$(document).ready(function() {
  var languageMap = {
    'Java': 'text/x-java',
    'Python': 'python',
    'Ruby': 'ruby',
  };
  var starterCode = $('.code-area');
  var boilerplate = $('.boilerplate-area');
  var language;
  var starterCodeMirror = CodeMirror.fromTextArea(starterCode.get(0), {
    lineNumbers: true,
  });

  var boilerplateMirror = CodeMirror.fromTextArea(boilerplate.get(0), {
    lineNumbers: true,
  });

  if (boilerplate.attr('readonly') === undefined) {
    language = $('#challenge_language option:selected').text()
    $('#challenge_language').on('change', function() {
      language = $('#challenge_language option:selected').text();
      starterCodeMirror.setOption('mode', languageMap[language]);
      boilerplateMirror.setOption('mode', languageMap[language]);
    });
  } else {
    language = $('#language').text();
    boilerplateMirror.setOption('readOnly', true);
    starterCodeMirror.setOption('mode', languageMap[language]);
    boilerplateMirror.setOption('mode', languageMap[language]);
  }
});
