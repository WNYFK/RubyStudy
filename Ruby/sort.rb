
class CBSort
	def sort
		array = ["ruby", "Perl", "PHP", "Python"]
		sorted = array.sort { |a, b| a <=> b }
		p sorted
	end

	def sortLength
		array = ["ruby", "Perl", "PHP", "Python"]
		sorted = array.sort { |a, b| a.length <=> b.length }
		p sorted
	end

	def sort1
		ary = %w(
		Ruby is a open source programming language with a focus
		on simplicity and productivity. It has an elegant syntax
		that is natural to read and easy to write.
		)
		call_num = 0
		sorted = ary.sort do |item|
			call_num += 1
			item.length
		end
		puts "排序结果 #{sorted}"
		puts "数组的元素数量 #{ary.length}"
		puts "调用块的次数 #{call_num}"
	end
end