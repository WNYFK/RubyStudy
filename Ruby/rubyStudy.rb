require 'builder'
xml = Builder::XmlMarkup.new(:target=>STDOUT, :indent=>2)
xml.coder {
	xml.name 'Matsumoto', :nickname => 'Matz'
	xml.language 'Ruby'
}



class DS

	def get_mouse_info(workstation_id)
		"Dual Optical"
	end

	def get_mouse_price(workstation_id)
		40
	end

	def get_cpu_info(workstation_id)
		"2.16 Ghz"
	end

	def get_cpu_price(workstation_id)
		150
	end
end

# ds = DS.new
# p ds.get_cpu_info(0)
# p ds.get_cpu_price(0)
# p ds.get_mouse_info(0)
# p ds.get_mouse_price(0)

class Computer
	instance_methods.each do |m|
		undef_method m unless m.to_s =~ /^__|object_id|method_missing|respond_to?/
	end

	def initialize(computer_id, data_source)
		@id = computer_id
		@data_source = data_source
		data_source.methods.grep(/^get_(.*)_info$/) {Computer.define_component $1}
	end

	def self.define_component(name)
		define_method(name) {
			info = @data_source.send "get_#{name}_info", @id
			price = @data_source.send "get_#{name}_price", @id
			result = "#{name.to_s.capitalize}: #{info}  ($#{price})"
		}
	end
end

computer = Computer.new(0, DS.new)
p computer.mouse
p computer.cpu
computer.display()

require 'delegate'

class Assistant
	def initialize(name)
		@name = name
	end

	def read_email
		"(#{@name}) You have a meeting today."
	end
end

class Manager < DelegateClass(Assistant)
	def initialize(assistant)
		super(assistant)
	end

	def attend_meeting
		"Please hold my calls."
	end
end

# frank = Assistant.new("Frank")
# anne = Manager.new(frank)
# p anne.attend_meeting
# p anne.read_email


class Roulette
	def method_missing(name, *args)
		person = name.to_s.capitalize
		super unless %w[Bob Frank Bill].include? person
		number = 0
		3.times do
			number = rand(10) + 1
			puts "#{number}..."
		end
		"#{person} got a #{number}"
		
	end
end

# number_of = Roulette.new
# p number_of.bob
# p number_of.frank


# class MyClass
# 	define_method :my_method do |my_arg|
# 		my_arg * 3
# 	end
# end
# obj = MyClass.new
# p obj.send(:my_method, 3)



# class Array
# 	def substitute(from, to)
# 		each_with_index do |e, i|
# 			if e == from
# 				self[i] = to
# 			end
# 		end
# 	end
# end

# book_topics = ["html", "java", "css"]
# book_topics.substitute('java', 'ruby')
# p book_topics

# def test_replace
# book_topics = ["html", "java", "css"]
# book_topics.substitute('java', 'ruby')
# expected = ["html", "ruby", "css"]
# end

# class MyClass
# 	def my_method
# 		@v = 1
# 	end
# end
# obj = MyClass.new
# p obj.methods.grep(/my/)
# p String.instance_methods == "abs".methods
# p String.methods == "abs".methods

# module MyModule
# 	MyConstant = "Outer constant"

# 	class MyClass
# 		MyConstant = "Inner constant"
# 	end
# end

# p MyModule::MyClass::MyConstant
# p MyModule::MyConstant