
def event(name, &block)
	@events[name] = block
end

def setup(&block)
	@setups << block
end

setup do 
	puts "Setting up sky"
	@sky_height = 100
end

event "the sky is falling" do
	@sky_height < 300
end

setup do
	puts "Setting up mountains"
	@mountains_height = 200
end

event "it's getting closer" do
	@sky_height < @mountains_height
end