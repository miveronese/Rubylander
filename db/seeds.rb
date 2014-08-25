# Encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


lesson = Lesson.create(title: "olllaaaa ", description: "bla")
lesson.steps.create(
result: "\"Hello World\"",
text: "Let's start saying hello to the world... ")

lesson.steps.create(
	result: 42,
text: "Yes!! Now let's do some mathematical operations...")


lesson.steps.create(
result: 42,
text:"<p>You can also....")


lesson.steps.create(
	result: 99,
text: "And...")

lesson_2 = Lesson.create(title: "oi ", description: "bla 2")
lesson_2.steps.create(
result: 30,
text:"You....")



