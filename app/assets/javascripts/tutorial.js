
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

  $('#lesson_title').text(lesson.title);  
   
  // if (lessonNumber == course.lessons.lenght) {

  //   $('#messages').text("You've finished all lessons in our course:" + course.title);
  //   $('#next_course').html ("<a href ='link to other course/path " + next_couse_id +"' " ">Next Couse</a>");

  // }else{

        if(stepNumber == lesson.steps.length){     
          $('#messages').text("Yay! Now you know two basic concepts of programming: strings and integers.Click on the button to start the next lesson"+ lesson.title );  
          $('#button').show();
          // $('#next_lesson').html("<a href= '/lessons/" + next_lesson_id + " ' >Next lesson</a>");
        }else{
          $('#messages').text(step.text);
        }

 // }

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
  $("#button").click(function() {
    $.ajax({
      url:"/lessons/" + next_lesson_id,
      context:document.body      
    }).done(function(lesson) {
      runStep(lesson, 0);
    });
  });

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


