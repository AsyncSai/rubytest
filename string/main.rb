# require 'ripper'
# Ripper.sexp("1+1").to_a
# require 'pp'
# pp RubyVM::InstructionSequence.compile('1+1').to_a

module MyMonkeyPatches
    refine String do
        def length
            30
        end
    end
end

class TestMyMonkey 
    using MyMonkeyPatches
    def string_length(string)
        string.length
    end
end

string = "foobar"
puts string.length

puts TestMyMonkey.new.string_length(string)
puts string.length
