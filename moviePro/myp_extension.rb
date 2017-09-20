
module MYP_Extension
  refine Enumerable do
    def contains
      self.each {|item| return true if yield(item) } if block_given?
      return false
    end

    def description
      self.each {|item| p item }
    end
  end
end
