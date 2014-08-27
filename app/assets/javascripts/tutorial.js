
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

  var step = lesson.steps[stepNumber]

  $('#lesson_title').text(lesson.title);  
   
  if(stepNumber == lesson.steps.length){     
    $('#messages').text("Congratulation! You completed the Lesson : "+lesson.title );  
  }else{
    $('#messages').text(step.text);
  }


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
         //if (stepNumber == lesson[0].steps.length - 1) {
            // TODO: go to next lesson or do something else
            // URL for next lesson is created in the controller by calling url_for(...)
            // window.location = new_url;
         //} else {
          runStep(lesson, stepNumber + 1);          
         //}
       // }

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
    $.getJSON("/lessons/1", function (lesson){
        runStep(lesson, 0);
     });
  });    
}


