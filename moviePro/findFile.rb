require './fileObject'
require 'set'
module MYP
  class Finder
    def initialize(extnames)
      @paths = Set.new
      @extnames = extnames
    end

    def self.find(extnames = ['.swift', '.m', '.h'])
      finder = Finder.new(extnames)
      finder.findFile(MYP::path)
    end

    def handleDir(path)
      dir = Dir.open(path)
      while name = dir.read
        next if name == "."
        next if name == ".."
        findFile(path + "/" + name)
      end
      dir.close
    end

    def handleFile(path)
      if @extnames.include?(File.extname(path))
        @paths.add(path)
      end
    end

    def findFile(path)
      if File.directory?(path)
        handleDir(path)
      else
        handleFile(path)
      end
      @paths
    end
  end
end
