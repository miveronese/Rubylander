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

function applyGlossaryTips(){
    $('.glossary-tips').tooltip({placement: 'top'});
}

function applyGlossaryPopover(){
    $('.glossary-popover').popover({trigger:'hover', placement:'top'});
}

function showStep(message) {
    $('#messages').html(message);
    applyGlossaryPopover();
    applyGlossaryTips();

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
    hideSummary();
    var createStepItem = function(step) {
        var stepItem = $("<li>");    
        stepItem.append(step.title);        
        return stepItem;
    };
    var createTitle = function(lesson) {
        var title = $("<h3>");
        title.append(lesson.title);
        return title;
    };

    $.getJSON("/lessons/", function(lessons) {
           var accordionDiv = $("#accordion");  
            lessons.forEach (function(lesson) {            
            accordionDiv.append(createTitle(lesson)); 
            var sizeOfStep = lesson.steps.length
 
            var stepsContainer = $("<div>");
            accordionDiv.append(stepsContainer);
            var stepsList = $("<ul>");
            stepsContainer.append(stepsList);            
            
            lesson.steps.forEach(function(step){
              stepsList.append(createStepItem(step));  
            });
            
        });

        accordionDiv.accordion({ header: "h3", collapsible: true, active: false, heightStyle:"content"}); 
    });


     $("#summary").show();
     $("#summary").click(function() {
        $("#summary-box").modal({show: true});
      });
}

function startTutorial() {
    $("#summary").hide();
    hideButton();
    hideSummary();
    var jqConsole = createJqconsole();

    $(window).click(function() {  
      jqConsole.Focus();  
    })
 
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

                    var expected;

                    try {
                        expected = eval("(" + step.result + ")");
                    } catch(err) {
                        alert(err);
                    }

                    if (typeof(expected) != "function") {
                        alert("expected result is not a function")
                    }

                    if (expected(result)) {
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