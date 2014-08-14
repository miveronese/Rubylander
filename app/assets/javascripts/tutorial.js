var tutorial = {
  title: "Javascript Values",
  language: "javascript",
  steps: [
    {
      message: "Javascript values are either numbers, strings, objects, arrays, booleans." +
        "Let's start with numbers. Numbers can be integers like 1, 2 or 5000 or floating point." +
        "For example 1.1, 2.111 and so forth. Try to add 1 + 2.",
      result: 3
    },
    {
      message: "OK, great. How about adding two floats 1.1 and 2.3",
      result: 3.4
    }
  ]
};


$(function () {
  var jqconsole = $('#console').jqconsole(tutorial.title + '\n', '>>> ');
  var lastResult;

  var jsrepl = new JSREPL({  
    input: function() {   
      console.log("INPUT WANTED");     
    },  
    output: function(s) {
      jqconsole.Write(s + '\n', 'jqconsole-output');
    },
    result: function(result) {
      lastResult = result;
      jqconsole.Write(result + '\n', 'jqconsole-result');
    }
    
    // error: errorCallback,  
    // progress: progressCallback,  
    // timeout: {  
    //   time: 30000,  
    //   callback: timeoutCallback  
    // }  
  }); 

  // this is the main loop which gets called from the loadLanguage callback below
  // the parameter step show
  function runStep(stepNumber) {
    // get the object for the step for the given step number
    // so it contains { message: "....", result: ... }
    var step = tutorial.steps[stepNumber];

    // Print the message
    jqconsole.Write(step.message + '\n');

    // when the user hits enter the following function gets called
    jqconsole.Prompt(true, function (input) {

      // the parameter input contains the user input
      // evaluate the input with the language interpreter
      jsrepl.eval(input);

      // running eval triggers the result function above
      // lastResult contains now the result of the eval
      setTimeout(function() {
        if (lastResult == step.result) {
          runStep(stepNumber + 1);
        } else {
          jqconsole.Write("sorry not correct. please try again. \n")
          runStep(stepNumber)
        }        
      }, 100);
    });
  }

  // Load the actual ruby interpreter which can take a while
  // the following function gets called when the interpreter is loaded
  jsrepl.loadLanguage(tutorial.language, function () {  
    jqconsole.Write('Interpreter loaded\n\n');

    // start the user interaction
    runStep(0);
  });
});