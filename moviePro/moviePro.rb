
module MYP
  require './findFile'
  def self.path
    "/Users/admin/moviepro/moviePro"
  end

  class Base
    def initialize
      @classes = Array.new
      @fileObjects = Array.new
    end

    def pop(name)
      @classes.delete_if {|item| item == name }
    end

    def self.find
    end
  end

  class Swift < Base

    def self.find
      swift = Swift.new
      fileObjects = MYP::Finder.find([".swift"])
      classes = fileObjects.map { |obj| obj.handleFile() }.flatten!
    end
  end

  class Objc < Base
    def initialize
      super(%r|^\s*@interface\s*([^:]*)|, %r|^\s*-\(|)
    end

    def self.find
      @classes = MYP::Finder.find([".m"]).handleFile()
    end
  end
end
