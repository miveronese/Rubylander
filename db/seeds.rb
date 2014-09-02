# Encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



lesson = Lesson.create(title: "Lesson 1 - Strings and Integers", description: "this is lesson 1")


lesson.steps.create(
result: "\"hello world\"",
text: "Strings

Strings are a data type used in programming mainly to represent text.

To write a string we need to enclose the data in quotation marks (\" \"). 
For example: \"This is a string\". 

Would you like to try?
Type in the console the string \"hello world\" and see what happens.")

# result: "function(x) { return "Thats wrong!"; }"

lesson.steps.create(
	result: 25,
text: "Integers

Strings are not the only data type. 
There are also integers which are whole numbers.

To write an integer you don't need to use the quotations marks (\" \").
Type the integer 25 in the console and see what happens.")


lesson.steps.create(
result: 5,
text:"Calculation

You can do a lot of mathematical operations with integers.
The trick is to know the symbols and their meaning.

+ : addition
- :subtraction
* : multiplication
/ : division

Now try to calculate 20 divided by 4 plus.")


lesson.steps.create(
result: 8,
text: "What if...
What happens if you write the numbers between quotations marks and try to do
mathematical operations with them?

Let's see!

Write \"10-5/2\" and check the result.

The programming just read the data as a text.
Now do the same operation without the quotations marks.")


lesson_2 = Lesson.create(title: "Lesson 2 - Variables ", description: "this is lesson 2")
lesson_2.steps.create(
result: "\"John\"",
text: "Creating variables

Variables are a way to represent data (strings, integers, etc).
To create a variable it is necessary to give a name and assign a value to it.
For example: name = \"Mary\"

Now, it's your turn!
Create a variable called my_name and assign the value \"John\" to it.
Press enter.

Then call the variable (you just need to write my_name) and see the result.")



lesson_2.steps.create(
result: "\"Caroline Smith\"",
text: "Concatenation

You can work with variables in different ways.
If you have two variables representing two strings, it's possible to concatenate them.
Concatenate, in computer science, means to join strings.

Try this in the console:

name = \"Caroline\" << \" Smith\"

The result will be \"Caroline Smith\".")





