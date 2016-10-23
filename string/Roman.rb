class Roman
    @@roman_to_arabric = [['M',1000],['CM',900],['D',500],['CD',400],
                            ['C',100],['XC',90],['L',50],['XL',40],['X',10],
                            ['IX',9],['V',5],['IV',4],['I',1]]
    @@arabic_to_roman = @@roman_to_arabric.collect {|x| x.reverse}.reverse
    MAX = 3999

    def initialize(number)                            
        if number.respond_to? :to_str
            @value = Roman.to_arabic(number)
        else
            Roman.assert_within_range(number)
            @value = number
        end
    end
    def Roman.assert_within_range(number)
        unless number.between?(1,MAX)
            msg = "#{number} can't be represented as a Roman number"
            raise RangeError.new(msg)
        end
    end
    def Roman.to_arabic(s)
        value = s
        if s.respond_to?(:to_str)
            c=s.dup
            value = 0
            invalid = ArgumentError.new("Invalid Roman number:#{s}")
            value_of_previous_number = MAX+1
            value_from_previous_number = 0
            @@roman_to_arabric.each_with_index do |(roman,arabic),i|
                value_from_this_number = 0
                while c.index(roman)==0
                    value_from_this_number += arabic
                    if value_from_this_number >= value_of_previous_number
                        raise invalid
                    end
                    c = c[roman.size..s.size]
                end
                if i>2 and @@roman_to_arabric[i-1][0].size > 1 and
                    value_from_previous_number + value_from_this_number >=
                    @@roman_to_arabric[i-2][1]
                    raise invalid
                end
                value += value_from_this_number
                value_from_previous_number = value_from_this_number
                value_of_previous_number = arabic
                break if c.size==0
            end
            raise invalid if c.size > 0
        end
        return value
    end

    def to_arabic
        @value
    end
    def to_roman
        value = to_arabic
        Roman.assert_within_range(value)
        repr = ""
        @@arabic_to_roman.reverse_each do  |arabic,roman|
            num,value = value.divmod(arabic)
            repr << roman * num
        end
        repr
    end

    def method_missing(m,*args)
        super unless @value.respond_to?(m)
        hex_args = args.collect do |arg| #(Roman) ? arg.to_int : arg
            arg.kind_of?(Roman) ? arg.to_int : arg
        end
        
        result = @value.send(m,*hex_args)
        return result if m== :coerce
        begin
            case result
            when Integer
                Roman.new(result)
            when Array
                result.collect do |el|
                    el.kind_of?(Integer) ?Roman.new(el) : el
                end
            else
                result
            end 
        rescue  RangeError
            result
        end
    end

    def respond_to?(method_name)
        super || @value.respond_to?(method_name)
    end

    def to_s
        to_roman
    end
end
class Fixnum
    def to_roman   
        Roman.new(self).to_s
    end
end

class String
    def to_roman
        Roman.new(self).to_s
    end
end

puts 72.to_roman,444.to_roman,1979.to_roman,
     Roman.to_arabic('LXXII')


def fibonacci(limit = nil)
    seed1 = 0
    seed2 = 1
    while not limit or seed2 <= limit
        yield seed2
        seed1,seed2 = seed2 ,seed1+seed2
    end
end

# fibonacci(3) {|x| puts x}
# fibonacci {|x| break if x>20;puts x}

require 'mathn'
primes = Prime.instance
# primes.each { |x| puts x;break if x>15}
# primes.first(10).each{|x| puts x}

def sieve(max=100)
    sieve = []
    (2..max).each{ |i| sieve[i] = i}
    (2..Math.sqrt(max)).each do |i|
        (i*i).step(max,i){ |j| sieve[j]=nil} if sieve[i]
    end
    sieve.compact
end
puts sieve(100000).size

class Prime
    @@primes = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,
                61,67,71,73,79,83,89,97,101]
    @@check_next = 103
    @@increment_limit_at =121
    def succ
        @index += 1
        while @index >= @@primes.length
            if @@check_next+4>@@increment_limit_at
               @@limit+=1
               @@increment_limit_at = @@primes[@@limit + 1]**2
            end
            add_if_prime
            @@check_next += 4
            add_if_prime
            @@check_next +=2
        end
        return @@primes[@index]
    end

    def initialize
        @index = -1
    end
end

class Prime
    private
    def add_if_prime
        factor = @@primes[2..@@limit].find { |prime| @@check_next % prime == 0}
        @@primes << @@check_next unless factor
    
    end
end
#primes = Prime.new

# gem 'creditcard'
# require 'creditcard'

# puts '5276 4400 6542 1319'.creditcard?

module Crediitcard
    def creditcard?
        numbers = self.to_s.gsub(/[^\d]+/,'').split(//)
        checksum = 0
        0.upto numbers.length do |i|
            weight = numbers[-1*(i+2)].to_i*(2-(i%2))
            checksum += weight % 9
        end
        return numbers[-1].to_i == 10 - checksum % 10
    end
end

class String
    include Crediitcard
end

class Integer
    include Crediitcard
end
puts '5276 4400 6542 1319'.creditcard?