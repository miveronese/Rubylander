
var greet = {
  welcome: "Welcome to RubyLander!"
};

var start = {
  preface: "It's time to learn Ruby. balblalblaal balblalblaal balblalblaal balblalblaal balblalblaal"
};

var tutorial = {
  title: "",
  language: "ruby",
  steps: [
    {
      message: "Let's start with numbers. Numbers can be integers like 1, 2 or 5000 or floating point." +
        "For example 1.1, 2.111 and so forth. Try to add 1 + 2.",
      result: 3
    },
    {
      message: "OK, great. How about adding two floats 1.1 and 2.3?",
      result: 3.4
    },
    {
      message: "Next. You could do a number multiplication something like 5*5 ",
      result: 25
    }
  ]
};


$(function () {

      $('#messages').text(start.preface);

      $('#submit').click(function(){
          $(this).hide();


        var jqconsole = $('#console').jqconsole(greet.welcome + '\n', '>>> ');
        var lastResult;

        var jsrepl = new JSREPL({  
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


        function runStep(stepNumber) {
          var step = tutorial.steps[stepNumber];
         
          $('#messages').text(step.message);

          jqconsole.Prompt(true, function (input) {
            jsrepl.eval(input);

            setTimeout(function() {
              if (lastResult == step.result) {
                 runStep(stepNumber + 1);          
              } else {
                jqconsole.Write("Oops, try again. \n")
                runStep(stepNumber)
              }        
            }, 100);
          });
        }


        jsrepl.loadLanguage(tutorial.language, function () {  
        jqconsole.Write(':) \n\n');
        
          runStep(0);
        });

      });


});
    

