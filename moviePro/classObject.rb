module MYP
  class BaseClassObject
    def initialize(name)
      @methodlist = Array.new
      @name = name
      @methodlist = Array.new
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
  end

end
