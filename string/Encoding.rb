$KCODE = 'u'
require 'jcode'
#!/usr/bin/ruby -Ku -rjcode
string = "\xef\xbc\xa1"+"\xef\xbc\xa2"+
        "\xef\xbc\xa3"+"\xef\xbc\xa4"+
        "\xef\xbc\xa5"+"\xef\xbc\xa6"

puts string.size
puts string.jsize