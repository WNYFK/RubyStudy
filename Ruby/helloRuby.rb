
=begin

require "./grep"
pattern = Regexp.new(ARGV[0])
filename = ARGV[1]
simple_grep(pattern, filename)

=end

require "date"
days = Date.today - Date.new(1993, 2, 24)
puts(days.to_i)

require "pp"
v=[{
key00: "《Ruby 基础教程 第4 版》", key01: "《Ruby 秘笈》",
key02: "《Rails3 秘笈》"
}]
p v
pp v

require "./myloop"
loop(100)

require "./hello_class"
bob = HelloWorld.new("Bob")
alice = HelloWorld.new("Alice")
ruby = HelloWorld.new
bob.hello
alice.hello
ruby.hello
bob.name = "Bob name"
bob.hello

