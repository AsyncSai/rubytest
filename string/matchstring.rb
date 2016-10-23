string = 'this is a 30-character string.'
if string =~ /([0-9]+)-character/ && $1.to_i == string.length
    puts "yes,there are #$1 characters in that string."
end

#puts string

match = Regexp.compile('([0-9]+)-character').match(string)
if  match && match[1].to_i == string.length
    puts  "yes,there are #$1 characters in that string."
end

string = '123'
string ='string123'
case string 
when /^[a-zA-Z]+$/
    puts "letters"
when /^[0-9]+$/
    puts 'number'
else
    puts 'Mixed'
end

case_insensitive = /mangy/i 
case_insensitive =~ "I'm mangy!"
puts case_insensitive
