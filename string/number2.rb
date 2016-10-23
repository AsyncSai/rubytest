require 'matrix'
require 'rational'
coefficients = [[2,10,8],[0,7,4],[5,5,5]].map do |row|
    row.map {|x| Rational(x)}
end
float_matrix = Matrix[[1.0,2.0],[2.0,1.0]]
puts coefficients = Matrix[*coefficients]
puts constants = Matrix[[Rational(54)],[Rational(30)],[Rational(35)]],
     solutions = coefficients.inverse * constants,
     float_matrix.inverse,
     float_matrix * float_matrix.inverse

require 'complex'
puts a = Complex(1,4),Complex::I,
     a.real,a.imag,
     b = Complex(1.5,4.25),
     b+1.5,b+1.5*Complex::I,b.conjugate

class Mandelbrot
    def initialize(bailout=10,iterations= 10)
        @bailout,@iterations = bailout,iterations
    end
    def mandelbrot(x, y)
        c = Complex(x, y)
        z = 0
        @iterations.times do |i|
            z = z**2 + c
            return false if z.abs > @bailout
        end
        return true
    end
    def render(x_size=80,y_size=24,inside_set="*",outside_set=" ")
        0.upto(y_size) do |y|
            0.upto(x_size) do |x|
                scaled_x = -2 + (3*x / x_size.to_f)
                scaled_y = 1 + (-2*y / y_size.to_f)
                print mandelbrot(scaled_x,scaled_y) ? inside_set : outside_set
            end
            puts
            end
    end
end

    Mandelbrot.new.render(25,10)

require 'delegate'
class HexNumber < DelegateClass(Fixnum)
    def to_s
        sign = self < 0 ? "-" : ""
        hex = abs.to_s(16)
        "#{sign}0x#{hex}"
    end

    def inspect
        to_s
    end
        
    
end

puts HexNumber.new(10),HexNumber.new(-10)

class BetterHexNumber < BasicObject
    def initialize(integer)
        @value = integer
        
    end

    def  method_missing(m,*args)
        super unless @value.respond_to?(m)
        hex_args = args.collect do |arg|
            arg.kind_of?(::BetterHexNumber) ? arg.to_int : arg
        end
        result = @value.send(m,*hex_args)
        return result if m == :coerce
        case result
        when ::Integer
            ::BetterHexNumber.new(result)
        when ::Array
            result.collect do |element|
                element.kind_of?(::Integer) ? ::BetterHexNumber.new(element) : element
            end
        else
            result
        end
        end
        def respond_to?(method_name)
            super || @value.respond_to?(method_name)
        end
        def to_s(*args)
            hex = @value.abs.to_s(16)
            sign = self < 0 ? "-" : ""
            "#{sign}0x#{hex}"
        end

        def inspect
            to_s
        end
    end

hundred = BetterHexNumber.new(100)

puts hundred+5