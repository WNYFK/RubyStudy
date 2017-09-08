
def traverse(path)
	if File.directory?(path)
		dir = Dir.open(path)
		while name = dir.read
			next if name == "."
			next if name == ".."
			p "文件名 #{name}"
			traverse(path + "/" + name)
		end
		dir.close
	else
		process_file(path)
	end
end

def process_file(path)
	puts "不是文件夹 #{path}"
end


# path = Dir.pwd
# traverse(path)

p Dir.glob("*")
p Dir.glob(".*")
p Dir.glob("*.txt")


# Dir.rmdir("data")

p Dir.glob("*/*")