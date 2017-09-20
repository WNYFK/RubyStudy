require './moviePro'
require 'set'
module MYP
  class ClassHandle
    def self.handle(swift_paths, objc_paths, classes)
      classes = SwiftClassHandle.handle(swift_paths, classes)
      classes = ObjcClassHandle.handle(objc_paths, classes)
      classes
    end
  end
end

module MYP
  class SwiftClassHandle < ClassHandle
    def self.handle(paths, classes)
      containsClasses = Set.new
      paths.each_with_index do |path, index|
        content = File.open(path).read
        classes.each do |swift|
          classRegrexp = /([\(\[{=:]|as\?|as!|is|return|,)\s*#{swift.name}[^\w]/
          #/[^(class)]\=?:?\s*\(?#{swift.name}\s*[^:][.\(?!,]?/
          containsClasses.add(swift) if content.match?(classRegrexp)
        end
        Progress.loading(index, paths.count)
      end
      cellitems = containsClasses.find_all {|swift| swift.name =~ /Item$/ }
      cellitems.each { |swift| swift.name.sub!(/Item$/, 'Cell') }
      containsClasses += cellitems
      containsClasses.each do |classItem|
        classes.delete_if {|item| item.name == classItem.name }
      end
      classes
    end
  end
end

module MYP
  class ObjcClassHandle < ClassHandle
    def self.handle(paths, classes)
      containsClasses = Set.new
      paths.each_with_index do |path, index|
        content = File.open(path).read
        classes.each do |objc|
          # reg1 = /[\(\[{=:\)]?\s*#{objc.name}\s*[^(.h|.m|:|\(][^\w]/
          # reg2 = /@interface\s*#{objc.name}\s*/
          reg1 = /([\(\[{=:]|as\?|as!|is|return|static)\s*#{objc.name}[^\w]/
          reg2 = /Class\s*=\s*"#{objc.name}"/
          # classRegrexp = /[^(@interface|@implementation)]\s*#{objc.name}[^(.h|.m)]\s*/
          # classRegrexp = /^[^(\/\/|@interface|@implementation)]\s*(\w\s*)*\[*#{objc.name}[^(.h|.m)]\s*/
          #/[^(class)]\=?:?\s*\(?#{swift.name}\s*[^:][.\(?!,]?/
          containsClasses.add(objc) if content.match?(reg1) || content.match?(reg2)
        end
        Progress.loading(index, paths.count)
      end
      cellitems = containsClasses.find_all {|objc| objc.name =~ /Item$/ }
      cellitems.each { |objc| objc.name.sub!(/Item$/, 'Cell') }
      containsClasses += cellitems
      containsClasses.each do |classItem|
        classes.delete_if {|item| item.name == classItem.name }
      end
      classes
    end
  end
end
