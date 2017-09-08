
class CBCopy
	def copy()
		from = ARGV[0]
		to = ARGV[1]
		src = File.open(from)
		begin
			dst = File.open(to, "w")
			data = src.read
			dst.write(data)
			dst.close
		ensure
			src.close

		end
		
	end
end