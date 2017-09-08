class CBTotal
	def total(form, to)
		result = 0
		form.upto(to) do |num|
			if block_given?
				result += yield(num)
			else
				result += num
			end
		end
		return result
	end
end