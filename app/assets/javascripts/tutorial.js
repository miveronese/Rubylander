
var greet = {
  welcome: "Welcome to RubyLander!"
};

var start = {
  preface: "Welcome to our tutorial. It's time to learn Ruby."
};


// option: these 3 variables also could be created inside startTutorial() 
//and passed to runStep, 
// instead of being a global. It avoids overriding other variables by accident.
var lastResult;
var jsrepl;
var jqconsole;

function runStep(lesson, stepNumber) {
  var step = lesson[0].steps[stepNumber];
       
  $('#messages').text(step.text);
  jqconsole.Prompt(true, function (input) {
    jsrepl.eval(input);

    setTimeout(function() {
      console.log(lastResult + ", " + step.result);
      if (lastResult == step.result) {
        // NOW WE NEED TO CHANGE THIS FUNCTION IF WE WANT MORE THEN LESSON 1. SO
        // IT COULD BE SOMETHING LIKE: IF iT is the last step, show the next button
        // if(stepNumber == lesson.steps.length-1 (thats ugly) (or lesson.steps.last???) 
    
        // } else {
         // else run the next step
         runStep(lesson, stepNumber + 1);
       // }

      } else {
        jqconsole.Write("Oops, try again. \n")
        runStep(lesson, stepNumber)
      }        
    }, 100);
  });
}

function startTutorial(lesson) {
  jqconsole = $('#console').jqconsole(greet.welcome + '\n', '>>> ');

  jsrepl = new JSREPL({  
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
    runStep(lesson, 0);
  });    
}


