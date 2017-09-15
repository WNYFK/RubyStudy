module MYP
  class BaseFileObject
    def initialize(path, extname)
      @path = path
      @basename = File.basename(path, extname)
      @classes = Array.new
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
      File.open(@path) do |io|
        io.each do |line|
          if line =~ classnamaRegrexp
            classname = $1.gsub(/\s+/, '').split('(')[0]
            swiftClass = SwiftObject.new(classname)
            @classes.push(swiftClass)
          else if line =~ methodRegrexp
          end
        end
      end
      classes
    end
  end

  class ObjcFileObject < BaseFileObject
    def initialize(path)
      super(path, %r|^\s*@interface\s*([^:]*)|, ".m")
    end
  end
end
