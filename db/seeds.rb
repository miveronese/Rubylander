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
text: "<b>Strings</b>

<p>Strings are a data type used in programming mainly to represent text.<p>

<p>To write a string we need to enclose the data in quotation marks (" "). 
For example: \"This is a string\".</p> 

<p>Would you like to try?
Type in the console the string <b>\"hello world\"</b> and see what happens.</p>")

# result: "function(x) { return "Thats wrong!"; }"

lesson.steps.create(
	result: 25,
text: "<b>Integers</b>

<p>Strings are not the only data type. 
There are also integers which are whole numbers.</p>

<p>To write an integer you don't need to use the quotations marks (" ").
Type the integer <b>25</b> in the console and see what happens.</p>")


lesson.steps.create(
result: 3,
text:"<b>Calculation</b>

<p>You can do a lot of mathematical operations with integers.
The trick is to know the symbols and their meaning.<p>

<p>+ : addition</p>
<p>- :subtraction</p>
<p>* : multiplication<p/>
<p>/ : division</p>

<p>Now try to calculate <b>16 divided by 2 plus 4 minus 3 multiplied by 3</b>.</p>")


lesson.steps.create(
result: 8,
text: "What if...
<p>What happens if you write the numbers between quotations marks and try to do
mathematical operations with them?</p>

<p>Let's see!</p>

<p>Write \"10-5/2\" and see the result.</p>

<p>Yes, there's no result! The programming just read the data as a text.
Now do the same operation without the quotations marks.</p>")


lesson_2 = Lesson.create(title: "Lesson 2 - Variables ", description: "this is lesson 2")
lesson_2.steps.create(
result: 22,
text: "Type 22 ")

lesson_2.steps.create(
result: 23,
text: "Type 23 ")

lesson_2.steps.create(
result: 23,
text: "Type 24 ")




