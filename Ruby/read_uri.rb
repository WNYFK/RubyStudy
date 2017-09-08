require "open-uri"


url = "http://ruby-doc.org/downloads/ruby_2_0_0_core_rdocs.tgz"
open(url) do |io|
	File.open("ruby_2_0_0_core_rdocs.tgz", "w") do |f|
		f.write(io.read)
	end
end