
module MYP
  require './findFile'
  def self.path
    "/Users/admin/moviepro/moviePro"
  end

  class Base
    def initialize(classnameRegexp, methodRegexp)
      @classes = Array.new
      @classnameRegexp = classnameRegexp
      @methodRegexp = methodRegexp
    end

    def pop(name)
      @classes.delete_if {|item| item == name }
    end

    def self.find
    end
  end

  class Swift < Base
    def initialize
      super(%r|^\s*class\s*([^:]*)|, %r|^\s*func|)
    end

    def self.find
      p MYP::Finder.find([".swift"])
    end
  end

  class ObjectiveC < Base
    def initialize
      super(%r|^\s*@interface\s*([^:]*)|, %r|^\s*-\(|)
    end

    def self.find
      p MYP::Finder.find([".m"])
    end
  end
end
