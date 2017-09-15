module MYP
  class FileObject
    def initialize(path)
      @path = path
      @extname = File.extname(path)
      @basename = File.basename(path, @extname)
      @classname = ""
    end
  end
end
