require "./searchFiles"

class SearchAllClasses
	attr_accessor :allClasses
	def initialize
		@allClasses = Array.new
	end

	def searchClasse
		searchUnuseClass = SeachFiles.new
		path = ARGV[0]
		if path == nil 
			path = "/Users/admin/moviepro/moviePro"
		end
		searchUnuseClass.findAllClassFiles(path)
		searchUnuseClass.allFilePaths.each { |path|
			classes = self.getClasses(path)
			if !classes.empty? 
				@allClasses += classes
			end
		}

	end

	def getClasses(path)
		classes = Array.new
		File.open(path) { |io|
			io.each { |line|
				re = %r|@interface\s.+?(\s)|
				# %r|^\s*@interface\s*([^(\s|:)]*)|
				if line =~ re
					classname = $1
					if !classes.include?(classname)
						classes.push(classname)
					end
				end
			}
			return classes
		}
		return classes
	end
end

searchClasses = SearchAllClasses.new
searchClasses.searchClasse
p searchClasses.allClasses



