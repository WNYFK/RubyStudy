class MyClass

end

def add_method_to(a_class)
	a_class.class_eval do
		def m
			'Hello!'
		end
	end
end

add_method_to String
p "aa".m

class Loan
	def initialize(book)
		@book = book
		@time = Loan.time_class.now
	end

	def self.time_class
		@time_class || Time
	end

	def to_s
		"#{@book.upcase} loaned on #{@time}"
	end
end

class FakeTime
	def self.now
		'Mon Apr 06 12:15:50'
	end
end

Loan.instance_eval { @time_class = FakeTime }
loan = Loan.new('War and Peace')
p loan.to_s


str = "just a regular string"
def str.title?
	self.upcase == self
end

p str.title?
p str.methods.grep(/title?/)
p str.singleton_methods

module MyModule
	def my_method
		'Hello'
	end
end
obj = Object.new
obj.extend MyModule
p obj.my_method

class MyClass
	extend MyModule

	def my_method
		'my_method'
	end
	alias :m :my_method
end

p MyClass.my_method
obj1 = MyClass.new
p obj1.my_method
p obj1.m













