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
