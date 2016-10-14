def wrap(s,width=78)
    s.gsub(/(.{1,#{width}})(\s+|\Z)/,"\\1\n")
end
def reformat_wrapped(s,width=78)
    lines=[]
    line = ""
    s.split(/\s+/).each do |word|
        if line.size+word.size>=width
            lines<<line
            line = word
        elsif line.empty?
            line = word
        else
            line<<" "<<word
        end
    end
    lines<<line if line
    return lines.join "\n"
end
#puts wrap("this test is too short to be wrapped")
#puts wrap("this test is too short to be wrapped",10)

string = %q{i find myself alone these days,more often than not,
watching the rain run down nearby windows.How long has it been 
raining?The newspapers now printy the total,but nbo one reads them
any more.}

#puts wrap(string,60)
#puts reformat_wrapped(string,60)

('aa'..'ag').each{|x| puts x}

def endless_string_succession(start)
    while true
        yield start
        start = start.succ
    end
end

endless_string_succession('fol') do |x|
    puts x
    break if x[-1] == x[-2]
end

s = '!@-'
13.times{puts s = s.succ}

("a".."e").to_a.reverse_each{|x| puts x}