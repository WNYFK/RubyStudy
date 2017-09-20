require './findFile'
require "./myp_extension"
require "./classHandle"
require "./progress"
require "set"
module MYP
  using MYP_Extension
  @@path = "/Users/admin/moviepro/moviePro"

  def self.setProjectPath(path)
    if path && path.length > 0
      @@path = path
    end
  end

  def self.path
    @@path
  end

  def self.find(extname, path)
    MYP::setProjectPath(path)
    @@swift = Swift.new(['.swift']).find
    @@objc = Objc.new(['.h', '.m']).find
    classes = ClassHandle.handle(@@swift.paths, @@objc.paths, @@swift.classes + @@objc.classes)
    p "swift总共 #{@@swift.classes.count} 个类"
    p "objc总共 #{@@objc.classes.count} 个类"
    p "未使用的类 #{classes.count}个，如下"
    classes.map { |item| item.name }.description
  end
end

module MYP
  using MYP_Extension

  class Base
    attr_accessor :paths
    attr_accessor :classes

    def initialize(extnames)
      @classes = Array.new
      @fileObjects = Array.new
      @extnames = extnames
    end

    def pop(name)
      @classes.delete_if {|item| item == name }
    end

    def find
      @paths = Finder.find(@extnames)
      @paths.each_with_index do |path, index|
         BaseFileObject.fileClasses(path).each do |obj|
           if !@classes.contains {|item| item.name == obj.name }
             @classes.push(obj)
           end
         end
         Progress.loading(index, @paths.count)
      end
      self
    end
  end

  class Swift < Base
  end

  class Objc < Base
  end
end
