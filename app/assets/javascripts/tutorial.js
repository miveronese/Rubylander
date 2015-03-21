  var FIRST_STEP = 0;
  var FIRST_LESSON = 0;
  var LAST_STEP_OF_FIRST_LESSON = 1;
  var console;
  var repl;

  function loadRubyLanguage(repl, languageCallback) {
    repl.loadLanguage("ruby", function() {
      languageCallback();
    });
  }

  function setCourseTitle(title) {
    $('#course_title').html(title);
  }

  function setLessonTitle(title) {
    $('#lesson_title').html(title);
  }

  function showStep(message) {
    $('#messages').html(message);
  }

  function next(id) {
    return id + 1;
  }

  function evaluateRailsAdminResults(lesson, stepNumber) {

    var step = lesson.steps[stepNumber];
    var resultFunction;

    try {
      resultFunction = eval("(" + step.result + ")");
      if (typeof(resultFunction) != "function") {
        console.Write("The result function for this step is not a function. Step id:" + step.id + "\n");
        runStep(lesson, stepNumber);
      }

    } catch (err) {
      console.Write("The result function for this step has a syntax error. Step id: " + step.id + ": " + err + "\n");
      runStep(lesson, stepNumber);
    }

    return resultFunction;
  }


  function runStep(lesson, stepNumber) {
    var step = lesson.steps[stepNumber];

      showStep(step.text);

      console.Prompt(true, function(input) {
        repl.once("error", function(e) {
          console.Write(e);
          runStep(lesson, stepNumber);
          repl.off("result");
        });

        repl.once("result", function(result) {
          console.Write(result + '\n', 'jqconsole-result');
          var resultFunction = evaluateRailsAdminResults(lesson, stepNumber);

          if (result == "nil") {
            runStep(lesson, stepNumber);
          } else {
            if (resultFunction(eval(result))) {
              runStep(lesson, stepNumber + 1);
            } else {
              runStep(lesson, stepNumber);
            }
          }

          repl.off("error");
        });

        repl.eval(input);
      });
    
  };

  function loadCourses(id) { 
    var path = '/courses/' + id;

    $.getJSON(path, function(data) { 
      var lesson_title = data.lessons[0].title;
      setLessonTitle(lesson_title);
      var course_title = data.title;
      setCourseTitle(course_title);
       
      runStep(data.lessons[0], FIRST_STEP);
    });  
  }

  function dropdownCourses() {
    var createCourseTitle = function(course) {
      var course_title = $("<li>");
      course_title.attr('id', course.id);
      course_title.attr('val', course.id);
      course_title.append(course.title);
      return course_title;
    };

    $.getJSON("/courses/", function(data) {
      data.forEach(function(course) {
        $("#list_dropdown").append(createCourseTitle(course));
      });               
    });

    $(".dropdown-menu").on('click', 'li', function() {
      var id = $(this).attr("id");
      loadCourses(id); 
    });
  }


  function startTutorial() {

    dropdownCourses();
    console = $('#console').jqconsole("Choose a course to activate this terminal.\n", '>>> ');

    $(window).click(function() {
      console.Focus();
    })

    repl = new JSREPL();
    repl.loadLanguage("ruby", function() {
      console.Write(" \n");
    });
  }

  $(document).on("ready page:load", function(){
    startTutorial();
  });

