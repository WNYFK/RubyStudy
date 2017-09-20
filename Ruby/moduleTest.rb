module CB
  @@path = "a"

  def self.path
    @@path
  end

  class Test
    attr_accessor :name
    def initialize
      @name = "aaa"
    end
  end
end

obj = CB::Test.new
p obj.name
obj.name = "chenbin"
p obj.name

p CB::path
