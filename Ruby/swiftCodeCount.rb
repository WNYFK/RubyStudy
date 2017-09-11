require "./searchFiles"


searchUnuseClass = SeachFiles.new([".swift"])
searchUnuseClass.findAllClassFiles(ARGV[0])
p searchUnuseClass.allFilePaths.count
# searchUnuseClass.allFilePaths.each { |path|
# 	File.open(path) { |io|

# 	}
# }