# Encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


lesson = Lesson.create(title: "Lesson 1 ", description: "this is lesson 1")

lesson.steps.create(
result: "\"Hello World\"",
text: "Let's start saying hello to the world...Type \"Hello World\" ")

lesson.steps.create(
	result: 42,
text: "Yes!! Now let's do some mathematical operations...Type 42")


lesson.steps.create(
result: 42,
text:"<p>Type 42")


lesson.steps.create(
	result: 99,
text: "Type 99")

lesson_2 = Lesson.create(title: "Lesson 2 ", description: "this is lesson 2")
lesson_2.steps.create(
result: 22,
text: "Type 22 ")

