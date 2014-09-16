
// <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
//   Launch demo modal
// </button>

// <!-- Modal -->
// <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
//   <div class="modal-dialog">
//     <div class="modal-content">
//       <div class="modal-header">
//         <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
//         <h4 class="modal-title" id="myModalLabel">Modal title</h4>
//       </div>
//       <div class="modal-body">
//         ...
//       </div>
//       <div class="modal-footer">
//         <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
//         <button type="button" class="btn btn-primary">Save changes</button>
//       </div>
//     </div>
//   </div>
// </div>


var FIRST_STEP = 0;
var FIRST_LESSON = 0;
var LAST_STEP_OF_FIRST_LESSON = 1;

function next(id) { return id + 1; }

function hideButton() {
    $("#button").hide();
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

function loadLesson(lessonNumber, runStep) {
    if(lessonNumber == 0){
       $.getJSON("/lessons/first", function(lesson){ 
        setLessonTitle(lesson.title);
        console.log(lesson.id)
        runStep(lesson, FIRST_STEP);
       });   
    }else{
       $.getJSON("/lessons/" + lessonNumber, function(lesson){
        setLessonTitle(lesson.title);
        runStep(lesson, FIRST_STEP);
       });
    }   
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
    $("#button").unbind();
    $("#button").click(function() {
        hideButton();
        loadLesson(nextLessonId, runStep);
    });
}

function startTutorial() {
    hideButton();
    var jqConsole = createJqconsole();
    var repl = createJsRepl(jqConsole);
    
    var runStep = function(lesson, stepNumber) {
        var step = lesson.steps[stepNumber];

        // if (lesson.id == FIRST_LESSON && stepNumber == LAST_STEP_OF_FIRST_LESSON) {
        //     loadLesson(next(lesson.id), runStep);  } else
       if (stepNumber == lesson.steps.length) {
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
                        // jqconsole.Write("Oops, you've made a mistake. Try again. \n")
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
        // loadLesson(FIRST_LESSON, runStep);
        // loadLesson("4", runStep);
        loadLesson("first", runStep);

    });
}