class CAddress

	def stdOutPut
		p @v4addr.join(".")
		p @hwaddr.join(":")
	end
	
	def increaseAddr
		@v4addr[3] = @v4addr[3].to_i + 1
		tmp = @hwaddr[5]
		tmp = tmp.hex
		tmp = tmp + 1
		@hwaddr[5] = format("%x", tmp)
		#p tmp.to_s(tmp)
	end

	def initialize(v4addr, hwaddr)
		@v4addr = v4addr
		@hwaddr = hwaddr
	end
end

p "input start v4 addr:"
p "ex) 192.168.0.1"
line = STDIN.gets
v4arr = Array.new
if line =~ /(\d+).(\d+)\.(\d+)\.(\d+)/
	p line
	v4arr << $1
	v4arr << $2
	v4arr << $3
	v4arr << $4
else
	p "error. invalid format."
end
v4addr = line

p "input start HW addr:"
p "ex) 00:18:51:00:10"
line = STDIN.gets

hwarr = Array.new
if line =~ /([[:xdigit:]]+):([[:xdigit:]]+):([[:xdigit:]]+):([[:xdigit:]]+):([[:xdigit:]]+):([[:xdigit:]]+)/
	p line
	hwarr << $1
	hwarr << $2
	hwarr << $3
	hwarr << $4
	hwarr << $5
	hwarr << $6
else
	p "error. invalid format."
end
hwaddr = line

line = STDIN.gets
num = line.to_i
if num > 200
	exit
else
end

addr = CAddress.new(v4arr, hwarr)

for i in 0..num
	addr.increaseAddr
	addr.stdOutPut
end
