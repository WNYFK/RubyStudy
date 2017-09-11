class SeachFiles
attr_accessor :extnames

attr_accessor :allFilePaths

def initialize(extnames = [".h", ".m", ".swift"])
	@extnames =  extnames
	@allFilePaths = Array.new
end

def handleFile(path)
	if @extnames.include?(File.extname(path))
		@allFilePaths.push(path)
	end
end

def handleDir(path)
	dir = Dir.open(path)
	while name = dir.read
		next if name == "."
		next if name == ".."
		self.findAllClassFiles(path + "/" + name)
	end
	dir.close
end

def findAllClassFiles(path)
	if File.directory?(path)
		self.handleDir(path)
	else
		self.handleFile(path)
	end
end

end

