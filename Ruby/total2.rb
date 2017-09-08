class CBTotal2
	def total2(from, to, &block)
		result = 0
		from.upto(to) do |num|
			if block
				result += block.call(num)
			else
				result += num
			end
		end
		return result
	end
end