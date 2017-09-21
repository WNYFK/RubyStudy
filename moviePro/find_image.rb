require './myp_extension'
require 'digest'

module MYP
  using MYP_Extension
  class Image
    attr_accessor :basename
    attr_accessor :md5

    def initialize(path)
      @basename = File.basename path
      @md5 = Digest::MD5.hexdigest File.read(path)
    end

    def self.find_diff(path)
      same_images = Hash.new
      paths = Dir.glob("#{path}/**/*.{png,jpg}")
      img_md5_arr = paths.map { |path|  Image.new(path) }
      img_md5_arr.each do |img1|
        img_md5_arr.each do |img2|
          if img1.basename != img2.basename && img1.md5 == img2.md5
            sub_arr = same_images[img1.md5] || Array.new
            sub_arr.push(img1) if !sub_arr.contains { |img| img.basename == img1.basename }
            sub_arr.push(img2) if !sub_arr.contains { |img| img.basename == img2.basename }
            same_images[img1.md5] = sub_arr
          end
        end
      end
      same_images.each_value do |sub_arr|
        p "以下图片相同"
        sub_arr.each {|img| p img.basename }
      end
    end
  end
end

MYP::Image.find_diff ARGV[0]
