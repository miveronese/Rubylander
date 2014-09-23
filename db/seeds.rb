# Encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 
lesson = Lesson.create(title: "<b>It's time to learn Ruby!</b>", content: " welcome message")

lesson.steps.create(
result: "\"start\"",
text: "<p>Here you will learn the basic concepts of Ruby, a programming language simple and easy to understand.</p>

<p>The window on the right side is an interactive web console. 
You can type Ruby commands in there and see the results.</p>

<p>Ready to start?</p>

<p>Type the word <b>\"start\"</b> on the web console and enjoy! 
(Don't forget the quotation marks). </p>")



lesson_1 = Lesson.create(title: "Lesson 1 - Strings, Integers and Floats", content: "this is lesson 1")

lesson_1.steps.create(
result: "\"hello world\"",
text: "<p>Let's start with strings.<p/>

<p>Strings are used in programming traditionally to represent text (words and phrases).</p>

<p>In Ruby, to write a string you need to enclose the data in quotation marks (\" \") as you just did when typed \"start\". 
</p>

<p> Other examples of strings:</p>
<p>\"This is a string\"</p>
<p>\"Flower\"</p>
<p>\"In a hole in the ground lived a hobbit\"</p>

<p>Type in the console the string \"hello world\" and see what happens.</p>")

#result: "function(x) { return "Thats wrong!"; }"


lesson_1.steps.create(
result: 25,
text: "<p> Good! </p>

<p> In Ruby, strings are not the only data type. There are also numbers.</p>
<p>When the numbers don't have a decimal point (like 1, 3, 7), they are called integers.
When they have a decimal point (like 10.5 or 1.2), they are called floats or floating-point numbers.</p>

<p>To write a number you don't need to use the quotations marks (\" \").</p>

<p>Type the integer 25 in the console.</p>")


lesson_1.steps.create(
result: 14,
text:"<p>That was easy!</p>

<p>You can do a lot of mathematical operations with numbers.
The trick is to use the right symbol:</p>

<p>+ for addition</p>
<p>- for subtraction</p>
<p>* for multiplication</p>
<p>/ for division</p>

<p> Try to calculate 20 divided by 4 plus 9.</p>")


lesson_1.steps.create(
result: 7,
text: "<p>You are good!</p>

<p> Can you guess what happens if you write numbers and mathematical operation inside a string?
Let's see!</p>

</p>Write \"10-6/2\" in the console and check the result.</p>

<p>The program just print the data as a text,since the information was between quotes.</p>

<p>Now do the same operation without the quotes. If you do it right, you will see the next lesson.</p>")

lesson_1.steps.create(
result: 1,
text: "<p> Great!! </p>

<p> Now that you have learned about integers, floats and strings, it's time to do some magic with them! 

<p> Imagine you have a string called \"1\" and want to convert it into an integer. Is it possible?
Sure!</p>

<p> Type .to_i  after the string: \"1\" and see... </p>")


lesson_1.steps.create(
result: "\"10.2\"",
text: "<p> That's it! You've just converted a string into an integer!</p>

<p> Now try the opposite and transform the number 10.2 into a string.

<p> You just have to type .to_s  after the number...

")

lesson_1.steps.create(
result: "\"next lesson\"",
text: "<p>  Very good!</p>

<p> Just to remember: strings, integers and floats are three data types used in Ruby.
Strings must be written inside quotes. 
To transform strings into integers and vice-versa use this codes: .to_i and to_s.</p>

<p> Ready to Lesson 2?
Type \"next lesson\" to learn about variables in Ruby.</p>

")

lesson_2 = Lesson.create(title: "Lesson 2 - Variables ", content: "this is lesson 2")
lesson_2.steps.create(
result: "\"Jane\"",
text: "<p>Variables are a way to store a value somewhere so you can get back to it later.</p>
<p>To create a variable you need to give it a name and assign a value to it.
For example:</p>
<p>name = \"Mary\" </p>
<p> age = 88</p>
<p>city = \"Berlin\"</p>


<p>Easy, right? Now it's your turn!</p>
<p>Create a variable called my_name and assign the value \"Jane\" to it.</p>")

lesson_2.steps.create(
result: "\"yellow\"",
text: "<p>Very good! </p>

<p> After you create a variable you can call it anytime in your program. 
To call a variable you just have to type its name.</p>

<p> Try this in the console:</p>
<p> Create a variable called color and assign the value \"yellow\" to it. </p>
<p> Press Enter. </p>
<p> Call the variable typing its name.</p>")

lesson_2.steps.create(
result: "\"Earth\"",
text: "<p>Well done! When you call a variable, its value is shown. In the last example, you typed the 
variable's name (color) 
and the programm showed its value (\"yellow\").</p>

<p> But...

<p>If you create a variable called color and try to call it writing Color there will be no result.
That happens because Ruby is a case sensitive language. <p/>

<p> Let's see.</p>

<p> Crete a variable called planet = \"Earth\" , press Enter and call it typing Planet.</p>

<p>Then call it again using low case...</p>")

lesson_2.steps.create(
result: 10,
text: "<p>Now it worked! The value is shown only if you type the variable's name correctly.</p> 


<p>Remember the magic that we have done in Lesson 1 transforming integers into strings and vice-versa?</p>

<p> Let's do it again. But this time with variables. </p>

<p> First, create a variable called number and assign the string 10 as its value.
<p> Press enter.<p>
<p> Then call the variable followed by .to_i
<p> Hit enter... ")


lesson_2.steps.create(
result: "\"10\"",
text: "<p>The command .to_i changed the variable value to an integer!</p> 


<p> How about transforming the variable into a string again?
<p> You just need to type .to_s after the variable's name.</p>")

lesson_2.steps.create(
result: 3,
text: "<p>Perfect!</p>

<p> One variable can be created by referencing other variables. Sounds crazy... But it's possible!</p>

<p> Try this in the console:</p>
<p>Create a variable a = 1
Press Enter
Create a variable b = 2
Press Enter
Create a variable c = a + b
Press Enter
Call the variable c and see what happens...</p>")


lesson_2.steps.create(
result: "\"Welcome dear Mary\"",
text: "<p>Awesome!</p>

<p> In Ruby you can work with variables in many others ways.</p>
<p> For example, embedding one variable into another. 

<p> Let's try it:</p>
<p> Create the variable name = \"Mary\"
<p> Press Enter
<p> Create the variable welcome = \"Welcome dear {#name}\"
<p> Press Enter
<p> Call the variable welcome and pay attention... </p>")

lesson_2.steps.create(
result: "\"Hello, I am 20 years old\"",
text: "<p>What happened?</p>
<p> The code {#name} in \"Welcome dear {#name}\" did the trick. 
It inserted the value of one variable (name)
into the other variable (welcome). </p>

Try this time with numbers:

Create a variable called age and assign to it the integer 20.
Create a variable called greeting that contains the following data:
 \"Hello, I am {#othervariablename} years old\".
Call the variable greeting.")


lesson_2.steps.create(
result: "\"\"",
text: "<p>Awesome!!</p>
<p> Now you are an expert in variables!</p>
<p> You also learned a lot about strings, integers and floats.</p>

<p> Repeat the lessons as many times as you want and
feel free to use the console window to play around with Ruby commands.</p>

<p> If you want to go deeper in your studies, 
check the <a href=\"http://en.wikibooks.org/wiki/Ruby_Programming\">ruby programming wikibook. </a></p>