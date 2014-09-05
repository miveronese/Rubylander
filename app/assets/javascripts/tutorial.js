
var greet = {
  welcome: "Welcome to RubyLander!"
};

var start = {
  preface: "Welcome to our tutorial. It's time to learn Ruby."
};

var lastResult;
var jsrepl;
var jqconsole;
var next_lesson_id;

function runStep(lesson, stepNumber) {
  $('#button').hide();

  next_lesson_id = lesson.id + 1;

  var step = lesson.steps[stepNumber]

        $('#lesson_title').html(lesson.title);  
        if(lesson.title == "Welcome"){
           $('#messages').html(step.text);  
           $('#button').show();
           $(function() {
            show_button();  
           });
        }else if(stepNumber == lesson.steps.length){     
          $('#messages').html("Congratulation..." );  
          $('#button').show();
          $(function() {
            show_button();  
          });
        }else{
          $('#messages').html(step.text);
        }

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
    $.getJSON("/lessons/1", function(lesson){
        runStep(lesson, 0);
    });
    
  });    
}


function show_button() {
  $("#button").click(function() {
      $.ajax({
        url:"/lessons/" + next_lesson_id,
        context:document.body      
      }).done(function(lesson) {
        runStep(lesson, 0);
      });
  });
}


