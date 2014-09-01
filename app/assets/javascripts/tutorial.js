222
var greet = {
  welcome: "Welcome to RubyLander!"
};

var start = {
  preface: "Welcome to our tutorial. It's time to learn Ruby."
};

var lastResult;
var jsrepl;
var jqconsole;


function runStep(lesson, stepNumber) {
  var step = lesson.steps[stepNumber];

  $('#messages').text(step.text);
  jqconsole.Prompt(true, function (input) {
    jsrepl.eval(input);

    setTimeout(function() {
      console.log(lastResult + ", " + step.result);
      if (lastResult == step.result) {
        runStep(lesson, stepNumber + 1);          
      } else {
        jqconsole.Write("Oops, try again. \n")
        runStep(lesson, stepNumber)
      }        
    }, 100);
  });
}

function startTutorial() {

  jqconsole = $('#console').jqconsole(greet.welcome + '\n', '>>> ');

  jsrepl = new JSREPL({
    error: function(e) {
      jqconsole.Write(e);
    }, 
    input: function() {   
    },  
    output: function(s) {
      jqconsole.Write(s + '\n', 'jqconsole-output');
    },
    result: function(result) {
      lastResult = result;
      jqconsole.Write(result + '\n', 'jqconsole-result');
    } 
  }); 


  jsrepl.loadLanguage("ruby", function() {  
    jqconsole.Write(":) \n" );  
    //setTimeout(function() { runStep(0); }, 10);

    $.getJSON("/lessons/1", function(lesson){
        runStep(lesson, 0);
    });
    
  });    
}


