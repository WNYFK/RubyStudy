class CBFile
	def open
		name = ARGV[0]
		file = File.open(name)
		begin
			file.each_line do |line|
				print line
			end
		rescue => e
		ensure
			file.close			
		end
	end
end