hash = {"key1"=>"val1","key2"=>"val2"}
string = ""
hash.each{|k,v| string<< "#{k} is #{v.reverse}\n"}
puts string
string.reverse!
string.each_byte{|o|puts ("#{o.chr}")}
octal = "\000\001\002\003"
octal.each_byte{|o|puts o}
hexa = "\x00\x01\x02\x03"
hexa.each_byte{|o|puts "#{o}" }

open('smiley.html','wb') do |f|
    f << '<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">'
    f << "\xe2\x98\xBA"

end

puts (:symbol.object_id)
"food\nbar".each {|c| puts c}