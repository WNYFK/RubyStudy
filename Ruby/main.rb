
 dir = Dir.open(Dir.pwd)

 dir.each do |name|
 	p name
 end

 dir.close