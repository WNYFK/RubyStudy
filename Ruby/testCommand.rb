require 'xcodeproject'
require 'rubygems'
# xcodebuild '-project /Users/admin/moviepro/moviePro.xcodeproj -target moviePro -configuration Debug'

proj = XcodeProject::Project.new('/Users/admin/moviepro/moviePro.xcodeproj')
# proj.read.targets.each do |target|
# 	puts target.name
# end
XcodeProject::Tasks::BuildTask.new(proj)