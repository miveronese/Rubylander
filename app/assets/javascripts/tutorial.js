


var FIRST_STEP = 0;
var FIRST_LESSON = 0;
var LAST_STEP_OF_FIRST_LESSON = 1;

function next(id) { return id + 1; }

function hideButton() {
   $("#button").hide();
}
function hideSummary (){
   $("#summary").hide();
}

function Glossary() {
    $("#glossary").html(); 
}

function createJqconsole() {
    return $('#console').jqconsole("Welcome to RubyLander!\n", '>>> ');
}

function createJsRepl(jqConsole) {
    return new JSREPL();
}
function checkAddress(lessonNumber){
    var address = "";
     if(lessonNumber == 0){
         address = "/lessons/first"; 
     }else{
         address = "/lessons/" + lessonNumber;
     }   
    return address; 
}

function loadLesson(lessonNumber, runStep) {

       $.getJSON(checkAddress(lessonNumber), function(lesson){
        setLessonTitle(lesson.title);
        runStep(lesson, FIRST_STEP);
       });   
}

function loadRubyLanguage(repl, languageCallback) {
    repl.loadLanguage("ruby", function() {
        languageCallback();
    });
}

function setLessonTitle(title) {
    $('#lesson_title').html(title);
}

function showStep(message) {
    $('#messages').html(message);
}

function showNextLesson(nextLessonId, runStep) {
    $('#messages').html("Click on Next Lesson to continue your learning");
    $("#button").show();
    $("#summary").show();
    $("#button").unbind();
    $("#button").click(function() {
        hideButton();
        loadLesson(nextLessonId, runStep);
    });
}

function summarylesson() {
    var createStepsList = function(steps) {
        var stepsContainer = $("<div>");
        var stepsList = $("<ul>");
        steps.forEach(function(step) {
            stepsList.append("<li>" + step.text + "</li>");
        });
        stepsContainer.append(stepsList);
        
        return stepsContainer;   
    };
    var createTitle = function(lesson) {
        var titleContainer = $("<h3>");
        titleContainer.append(lesson.title);

        return titleContainer;
    };


    var summaryToggle = false;
    $("#summary").show();
  //abrir e fechar 
    $("#summary").click(function() {
       if(!summaryToggle){
            accordion.show();            
            summaryToggle = true; 
        }else{
            accordion.hide();
            summaryToggle = false;
        }    
    });

    var accordion = $("#accordion");
    accordion.hide();
    $.getJSON("/lessons/", function(lessons) {
        lessons.forEach (function(lesson) {
            var title = createTitle(lesson);
            accordion.append(title);
            var stepsList = createStepsList(lesson.steps);
            accordion.append(stepsList);
        });
        accordion.accordion({ header: "h3", collapsible: true, active: false }); 
    });

  

}


function startTutorial() {
    hideButton();
    hideSummary();
    var jqConsole = createJqconsole();
    var repl = createJsRepl(jqConsole);
    summarylesson();
    var runStep = function(lesson, stepNumber) {
        var step = lesson.steps[stepNumber];
        

       if (lesson.id == FIRST_LESSON && stepNumber == LAST_STEP_OF_FIRST_LESSON) {
            loadLesson(next(lesson.id), runStep);  
        } else if (stepNumber == lesson.steps.length) {
            showNextLesson(next(lesson.id), runStep);
        } else {
            showStep(step.text);
            jqConsole.Prompt(true, function (input) {
                repl.once("error", function(e) {
                    jqConsole.Write(e);
                    runStep(lesson, stepNumber);
                    repl.off("result");
                });
                repl.once("result", function(result) {
                    jqConsole.Write(result + '\n', 'jqconsole-result');

                    if (result == step.result) {
                        runStep(lesson, stepNumber + 1);
                    } else {
                        runStep(lesson, stepNumber);
                    }
                    repl.off("error");
                });
                repl.eval(input);
            });
        }
    };

    loadRubyLanguage(repl, function() {
        jqConsole.Write(":) \n" );
        loadLesson(FIRST_LESSON, runStep);
    });
}