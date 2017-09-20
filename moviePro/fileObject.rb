require './classObject'
module MYP
  class BaseFileObject
    def self.fileClasses(path)
      if File.extname(path) == ".swift"
        SwiftFileObject.handleFile(path)
      else
        ObjcFileObject.handleFile(path)
      end
    end

    # get classObject
    def self.handleFile(path)
    end
  end
end

module MYP
    class SwiftFileObject < BaseFileObject
      def self.handleFile(path)
        classnameRegrexp = /^[^(\s*\/*)]*\s*[a-zA-Z_]*\s*class\s+([^(func|var)][a-zA-Z0-9_]+)\s*[:<]?\s*.*{?/
        classes = Array.new
        File.open(path) do |io|
          io.each do |line|
            if line =~ classnameRegrexp #匹配到类名
              classes.push(SwiftObject.new($1, @path))
            end
          end
        end
        classes
      end
    end
end

module MYP
  class ObjcFileObject < BaseFileObject
    def self.handleFile(path)
      classnameRegrexp = /^[^(\s*\/*)]*\s*@interface \s*([^:][a-zA-Z0-9_]+)\s*.*$/
      classes = Array.new
      File.open(path) do |io|
        io.each do |line|
          if line =~ classnameRegrexp #匹配到类名
            classes.push(ObjcObject.new($1, path))
          end
        end
      end
      classes
    end
  end
end
