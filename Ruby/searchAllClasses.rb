require "./searchFiles"
require "set"

class SearchAllClasses
	attr_accessor :allClasses
	def initialize
		@allClasses = Set.new
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
		classes = Set.new
		File.open(path) { |io|
			io.each { |line|
				re_oc = %r|^\s*@interface\s*([^:]*)|
				if line =~ re_oc
					classname = $1.gsub(/\s+/, '').split('(')[0]
					classes.add(classname)
					next
				end
				re_swift = %r|^\s*class\s*([^:]*)|
				if line =~ re_swift
					classname = $1.gsub(/\s+/, '').split('{')[0]
					classes.add(classname)
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



