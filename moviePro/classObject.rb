module MYP
  class BaseClassObject
    attr_accessor :name
    attr_accessor :path
    def initialize(name, path)
      @methodlist = Array.new
      @name = name
      @path = path
    end

    def methodHand
    end

    def addMethod(name)
      @methodlist.push(name)
    end
  end

  class SwiftObject < BaseClassObject
  end

  class ObjcObject < BaseClassObject
    def initialize(name, path)
      tmpPath = path.sub(/.h$/, '.m')
      super(name, tmpPath)
    end
  end
end
