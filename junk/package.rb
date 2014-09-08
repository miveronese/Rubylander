
module Animals
	class Dog

		def say_hello
			puts "woof"
		end
	end

	class Cat

		def say_hello
			puts "meow"
		end
	end
end

module Food
	class Biscuit

		def initialize(nutrition_value)
			@nutrition_value = nutrition_value
		end

		def is_healthy?
			if @nutrition_value > 5
	           #puts "it's healthy"
	           true
			else
				#puts "do you want to kill your pet?"
				false
			end
		end
	end
end


fido = Animals::Dog.new
fido.say_hello

garfield = Animals::Cat.new
garfield.say_hello

nham = Food::Biscuit.new(4)

puts nham.is_healthy?

