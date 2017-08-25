class Point
	attr_accessor :x
	attr_accessor :y

	def initialize(x, y)
		@x = x
		@y = y
	end

	def +@
		dup
	end

	def -@
		self.class.new(-x, -y)
	end

	def ~@
		self.class.new(-y, x)
    end

    def [](index)
    	case index
    	when 0
    		x
    	when 1
    		y
    	else
    		print "out of range #{index}"
    	end
    end

    def []=(index, val)
    	case index
    	when 0
    		self.x = val
    	when 1
    		self.y = val
    	else
    		raise ArgumentError, "out of range `#{index}`"
    	end
    	
    end
end
