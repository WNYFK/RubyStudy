require './findFile'
module MYP
  def self.path
    "/Users/chenbin/moviepro/moviePro"
  end

  class Base
    def initialize(extname)
      @classes = Array.new
      @fileObjects = Array.new
      @extname = extname
    end

    def pop(name)
      @classes.delete_if {|item| item == name }
    end

    def self.find(extname)
      fileObjects = MYP::Finder.find([extname])
      classes = fileObjects.map { |obj| obj.handleFile() }.flatten!
      classes
    end
  end

  class Swift < Base
    def self.find(extname = ".swift")
      classes = super(extname)
      p classes
    end
  end

  class Objc < Base
    def self.find(extname = ".m")
      classes = super(extname)
      p classes
    end
  end
end
