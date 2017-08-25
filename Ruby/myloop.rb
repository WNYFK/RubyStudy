def myloop
	while true
		yield
	end
end

def loop(maxNum)
	num = 1
	myloop do
		puts "nums is #{num}"
		break if num > maxNum
		num *= 2
	end
end


