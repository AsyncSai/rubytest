def saysomething
    puts("hello")
    end
    saysomething

    puts 'hello world'

    print('enter your name')
    name = ("\n\t#{(1+2)*3}\nGoodbye")
    puts name
=begin
this is a 
multiline
comment
=end

#this is a comment

    subtotal = 100.00
    taxrate = 0.175
    tax = subtotal*taxrate

    if tax<0.0
        tax=0.0
    end
    puts "tax on $#{subtotal} is $#{tax},so grandtotal is $#{subtotal+tax}"



#local verible

localvar = "hello"
$globalvar = "goodbye"

#methods

def amethod
    localvar = 10
    puts localvar
    puts $globalvar
    end

    def anothermethod
        localvar =500
        $globalvar = "bbbb"
        puts localvar
        puts $globalvar
        end

        amethod
        anothermethod
        amethod
        puts localvar
