# trace = TracePoint.new(:raise) do |t|
#     # require 'debug'
#     puts t.inspect
# end

# trace.enable
# require 'doesnt_exit'

module MyHelper
    def  save
        puts 'before'
        super
        puts 'after'       
    end
end
class MyBadClass  
    include MyHelper

    def save
        puts 'mycode'
    end
end

class MyGoodClass  
    prepend MyHelper

    def save
        puts 'mycode'
    end
end
MyBadClass.new.save
MyGoodClass.new.save

# begin
#     require 'doesnt_exit'
# rescue => nil.some_method
    
# end



require 'pp'
require 'socket'
pp GC.start
puts __dir__
pp Socket.getifaddrs
# require File.expand_path(
#     File.__dir__,'..','lib','mylib')
# )

# require_relative File.join('..','lib','mylib')

'the quick brown fox'.each_char.chunk do |x|
    %w(a e i o u).include?(x)? "vowel": "consonant"
    end.each do |type,letters|
        puts "#{type}:#{letters.join}"
   end


thread = Thread.new do
    puts 'hello ruby'
end

fiber = Fiber.new do |multi|
    Fiber.yield multi * 10
    Fiber.yield multi * 10_000_000
    "done"
    #puts 'hello world'
end
puts fiber.resume(2)

puts fiber.resume(2)

puts fiber.resume(2)


require 'pp'
pp Encoding.list
string = "some string \u2746"

puts string
puts string.encoding
string = string.force_encoding(Encoding::ISO_8859_1)
puts string.encoding

puts Random.rand

seed =1234
random_generator = Random.new(seed)

puts random_generator.rand
puts random_generator.rand

random_generator2 = Random.new(seed);
puts random_generator2.rand
puts random_generator2.rand

require 'objspace'
object =Hash.new(0)
ObjectSpace.each_object{|obj| object[obj.class] += 1}
pp object.sort_by{|k,v| -v}

require 'prime'
Prime.each(100) do |prime|
    p prime
end

require 'cmath'

puts CMath.sqrt(-9)

require 'shellwords'
argv = Shellwords.split('ls -la')
puts argv
puts argv << Shellwords.escape("special's.txt")
command_to_exec = argv.join(" ")
system(command_to_exec)

#require 'erb'
t=ERB.new %q(Chunk <%=food %>!)

# puts fiber.resume(2)

   