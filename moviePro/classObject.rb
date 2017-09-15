module MYP
  class BaseClassObject
    def initialize(name)
      @methodlist = Array.new
      @name = name
    end
  end

  class SwiftObject < BaseClassObject
  end

  class ObjcObject < BaseClassObject
end
