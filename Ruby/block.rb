

class Resource
	def dispose
		@disposed = true
	end

	def disposed?
		@disposed
	end
end

module Kernel
	def using(resource)
		begin
			yield
		ensure
			func = "dispose".to_sym()
			resource.send(func) if resource.respond_to?(func)
		end
	end
end

resource = Resource.new
Kernel::using(resource) {
	p "using inner"
}
p resource.disposed?

def math(a, b)
	yield(a, b)
end

def teach_math(a, b, &operation)
	puts "Let's do the math:"
	puts math(a, b, &operation)
end

teach_math(2, 3) {|x, y| x * y}

require 'highline'

# hl = HighLine.new
# friends = hl.ask("Friends?", lambda {|s| s.split(',')})
# puts "You're friends with: #{friends.inspect}"

def double(callable_object)
	callable_object.call * 2 if callable_object.respond_to?(:call)
end

l = lambda { return 10 }
p double(l)

def another_double
	p = Proc.new { return 10 }
	result = p.call
	return result * 2
end

p another_double













