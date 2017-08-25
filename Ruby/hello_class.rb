class HelloWorld
	def initialize(myname = "Ruby")
		@name = myname
	end

	def hello
		puts "Hello, world, I am #{@name}"
	end

	attr_accessor :name

end
