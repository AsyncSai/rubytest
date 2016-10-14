number =5
puts("the number is #{number}")
puts("the number afte #{number} is #{number.next}")
puts("the number befor #{number} is #{number-1}")
puts("we are ##{number}")

template = 'Oceania has always been a war with %s'
puts(template % 'Eurasia')
puts('to 2 decimal places:%.2f' % Math::PI)
puts('zero-padded:%.5d' % Math::PI)
template = ERB.new %q{ch}
puts template