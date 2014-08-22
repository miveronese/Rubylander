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
result: "Hello World",
text: "balblalbalablblbal")

lesson.steps.create(
	result: 42,
text: "bleleleleleleleel")


lesson.steps.create(
result: 42,
text:"<p>bliilhllhlhilhlihi")


lesson.steps.create(
	result: 99,
text: "blublbublulblubluu")

# Lesson.create(title:"Parabéns!!",content:
# "<p> Você acaba de concluir seus primeiros passos em Ruby!</p>")

# Lesson.create(title:"Aguarde novidades!!",content:
# "<p> Em breve, teremos mais lições e um terminal decente! :D :D</p>")
