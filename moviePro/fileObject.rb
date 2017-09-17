require './classObject'
module MYP
  class BaseFileObject
    def initialize(path, extname)
      @path = path
      @basename = File.basename(path, extname)

    end

    def self.fileObjet(path)
      if File.extname(path) == ".swift"
        SwiftFileObject.new(path)
      else
        ObjcFileObject.new(path)
      end
    end

    # get classObject
    def handleFile
    end
  end

  class SwiftFileObject < BaseFileObject
    def initialize(path)
      super(path, ".swift")
    end

    def handleFile
      classStartRegrexp = %r|^\s*class\s*([^:]*)|
      classEnd = false
      methodRegrexp = %r|^\s*func\s*|
      classes = Array.new
      File.open(@path) do |io|
        io.each do |line|
          if line =~ classStartRegrexp #匹配到类名
            classname = $1.gsub(/\s+/, '').split('(')[0]
            classes.push(SwiftObject.new(classname))
          # else if line =~ methodRegrexp
          #   methodname = $1.gsub(/\s+/, '').split('(')[0]
          #   classes.last.addMethod(methodname)
          end
        end
      end
      classes
    end
  end

  class ObjcFileObject < BaseFileObject
    def initialize(path)
      super(path, ".m")
    end

    def handleFile
      classStartRegrexp = %r|^\s*@implementation \s*([^(\n)]*)|
      classEnd = false
      methodRegrexp = %r|^\s*func\s*|
      classes = Array.new
      File.open(@path) do |io|
        io.each do |line|
          if line =~ classStartRegrexp #匹配到类名
            classname = $1.gsub(/\s+/, '').split('(')[0]
            classes.push(ObjcObject.new(classname))
          # else if line =~ methodRegrexp
          #   methodname = $1.gsub(/\s+/, '').split('(')[0]
          #   classes.last.addMethod(methodname)
          end
        end
      end
      classes
    end
  end
end
