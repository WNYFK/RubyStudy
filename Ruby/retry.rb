class CBRetry
	def retry
		file = ARGV[0]
		begin
			io = File.open(file)
		rescue => ex
			p ex.message
			sleep 10
			retry
		end
	end

end