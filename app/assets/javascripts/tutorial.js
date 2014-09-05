var greet = {
  welcome: "Welcome to RubyLander!"
};

var start = {
  preface: "Welcome to our tutorial. It's time to learn Ruby."
};

var lastResult;
var jsrepl;
var jqconsole;
var next_lesson_id = 0;
var next_step = 0;

function runStep(lesson, stepNumber) {
  $('#button').hide();
  
  var step = lesson.steps[stepNumber]
        $('#lesson_title').html(lesson.title);  
        // if(lesson.title == "Welcome"){
        //    $('#messages').html(step.text);  
        //    $('#button').show();
        //    $(function() {
        //     show_button();  
        //    });
        // }else 
        if(stepNumber == lesson.steps.length){     
          next_lesson_id = lesson.id + 1;
          console.log("Next_lesson_id:"+next_lesson_id);
          console.log("stepNumber == lesson.steps.length:"+ stepNumber +"--"+ lesson.steps.length);
          $('#messages').html("Click on Next Lesson for you to continue your learning" );   
          $('#button').show();
          $(function() {
            show_button();  
          });
        }else{
          console.log("stepNumber != lesson.steps.length:"+ stepNumber +"--"+ lesson.steps.length);
          $('#messages').html(step.text);
        }

  jqconsole.Prompt(true, function (input) {
    jsrepl.eval(input);

    setTimeout(function() {
      if (lastResult == step.result) {
        console.log(">>>Last Result (our function) : "+ lastResult);
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
      console.log(">>>Last Result (jqconsole) : "+ lastResult);
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
    $(this).hide();
      $.ajax({
        url:"/lessons/" + next_lesson_id,
        context:document.body      
      }).done(function(lesson) {
        runStep(lesson, 0);
      });
  });
}

