

module  Math
    def Math.logb(num,base)
        log(num)/log(base)
    end
end
class NumberParser
    @@number_regexps={
        :to_i => /([+-]?[0-9]+)/,
        :to_f => /([+-]?[0-9]*\.)?[0-9]+(e[+-]?[0-9]+)?/i,
        :oct => /([+-]?[0-7]+)/,
        :hex => /\b([+-]?(0x)?[0-9a-f]+)\b/i
    }
    def NumberParser.re(parsing_method=:to_i)
        re = @@number_regexps[parsing_method]
        raise ArgumentError,"No regexp for #{parsing_method.inspect}!" unless re
            return re
    end
    def extract(s,parsing_method=:to_i)
        numbers = []
        s.scan(NumberParser.re(parsing_method)) do |match|
            numbers << match[0].send(parsing_method)
        end
        numbers
    end
end




class Float
    def approx(other,relative_epsilon=Float::EPSILON,epsilon=Float::EPSILON)
        difference = other - self
        return true if difference.abs<=epsilon
        relative_error = (difference / (self > other ? self : other)).abs
        return relative_error <= relative_epsilon
    end
end

class Float
    def absolute_approx(other,epsilon=Float::EPSILON)
        return (other-self).abs <= epsilon
    end
end

def rand_word
    letters = {?v=>'aeiou',
                ?c=>'bcdfghjklnmpqstrvwyz'}
    word = ''
    'cvcvcvc'.each_byte do |x|
        source = letters[x.chr]
        word << source[rand(source.length)].chr
        end
    return word
end


puts 1000.class
puts 1000_000_000_000_000_000.class
puts 01.class,0.01.class,1.0.class,
        'bbc',
        'hhh'
p = NumberParser.new
pw = "today's number are 104 and 309."

puts NumberParser.re(:to_i).match(pw).captures,
        p.extract(pw,:to_i),
        p.extract('$60.50',:to_f),
        p.extract('I fed the monster at Canoga Park Waterslides',:hex),
        p.extract('In octal,fifteen is 017.',:oct),
        p.extract('From 0 to 10e60 in -2.4 seconds',:to_f),
        p.extract('From 0 to 10e60 in -2.4 seconds')

require 'scanf'
require 'bigdecimal'
require 'bigdecimal/math'
require 'rational'

s='0x10 4.44 10'.scanf('%x %f %d')
dividend = Math.log(2)
(1..6).collect{|x| Math.log(x)/dividend}
puts s
nm = "0.1234566777777899994"
two = BigDecimal("2")
a = ['item1','item2','item3']
puts 100.2.approx(100.1+0.1),
        10e10.approx(10e10+1e-5),
        100.0.approx(100+1e-5),
        (1.8+0.1).absolute_approx(1.9),
        BigDecimal("10").to_s,
        nm.to_f,
        BigDecimal(nm),
        BigDecimal('105000').split,
        BigMath::sqrt(two,10).to_s("F"),
        float=2.0/3.0,
        float *100,
        float *100/42,
        rational = Rational(2,3),
        rational.to_f,
        rational*100,
        rational*100/42,
        10+rational,
        rand,
        rand,
        rand(5),
        rand(5),
        rand(5),rand(1000)

m={key1:'value1',
    key2:'value2',
    key3:'value3'}
values=m.values
srand=1
puts a[rand(a.size)],  values[rand(values.size)],
        rand_word,rand_word,rand_word,
        rand(1000),rand(1000),rand(1000),
        0b100,
        0o100,
        0x100,
        "1045".to_i(10),
        "abc".to_i(16),
        100.to_s(2),
        100.to_s(16),
        Math.log(1),Math.log(Math::E),Math.log(10),
        (1..6).collect{|x| Math.log(x) / dividend}
# srand=5''
# puts    rand(1000),rand(1000),rand(1000)
# # srand=5
# # puts    rand(1000),rand(1000),rand(1000)
# require 'bigdecimal/util'
# module BigMath
#     alias :log_slow :log
#     def log(x,prec)
#         if x<=0 || pre <= 0
#             raise ArgumentError,"zero pr negative argument for log"
#         end
#         return x if x.infinite? || x.nan?
#         sign,fraction,power,exponent = x.split
#         fraction = BigDecimal(".#{fraction}")
#         power = power.to_s.to_d
#         log_slow(fraction,prec)+(log_slow(power,prec)*exponent)

#     end
# end
# include BigMath

# number = BigDecimal("1234.5678")
# prec = 50
# puts Math.log(number),BigMath.log_slow(number,prec).round(prec).to_s("F")

# def mean(array)
#     array.each{|sum,x| sum+=x}/array.size.to_f
# end

def median(array,already_sorted=false)
    return nil if array.empty?
    array = array.sort unless already_sorted
    m_pos = array.size/2
    return array.size % 2==1?array[m_pos]: 0
end

class Numeric
    def degrees
        self * Math::PI/180
    end
end
require 'mathn'
a1=[[1,1,0,1],
    [2,0,1,2],
    [3,1,1,2]]
a2=[[1,0],
    [3,1],
    [1,0],
    [2,2.5]]
puts median([1,2,3,4,5]),median([1,2,3,4]),
     90.degrees,Math::tan(45.degrees),
     m1 = Matrix[*a1],m2=Matrix[*a2],
     m1*m2

class Matrix 
    def self.multiply(*matrices)
        cache = []
        matrices.size.times{cache<<[nil]*matrices.size}
        best_split(cache,0,matrices.size-1,*matrices)
        multiply_following_cache(cache,0,matrices.size-1,*matrices)
    end

    :private
    def self.multiply_following_cache(cache,chunk_start,chunk_end,*matrices)
        if chunk_end == chunk_start
            return matrices[chunk_start]
        elsif chunk_end-chunk_start == 1
            lhs,rhs=matrices[chunk_start..chunk_end]
        else
            split_after = cache[chunk_start][chunk_end][1]
            lhs = multiply_following_cache(cache,chunk_start,split_after,* matrices)
            rhs = multiply_following_cache(cache,split_after+1,chunk_end,* matrices)
        end
        if $DEBUG
            lhs_dim = "#{lhs.row_size}x#{lhs.column_size}"
            rhs_dim = "#{rhs.row_size}x#{rhs.column_size}"
            cost = lhs.row_size * lhs.column_size * rhs.column_size
            puts "Multiplying #{lhs_dim} by #{rhs_dim}:cost #{cost}"
        end
        return lhs * rhs
    end
    def self.best_split(cache,chunk_start,chunk_end,*matrices)
    if chunk_end == chunk_start
        cache[chunk_start][chunk_end] = [0,nil]
    end
    return cache[chunk_start][chunk_end] if cache[chunk_start][chunk_end]
    mininum_costs = []
    chunk_start.upto(chunk_end-1) do |split_after|
        lhs_cost = best_split(cache,chunk_start,split_after,*matrices)[0]
        rhs_cost = best_split(cache,split_after+1,chunk_end,*matrices)[0]

        lhs_rows = matrices[chunk_start].row_size
        rhs_rows = matrices[split_after+1].row_size
        rhs_cols = matrices[chunk_end].column_size
        merge_cost = lhs_rows*rhs_rows*rhs_cols
        cost = lhs_cost+rhs_cost+merge_cost
        mininum_costs << cost
    end
    mininum = mininum_costs.min
    mininum_index = chunk_start + mininum_costs.index(mininum)
    return cache[chunk_start][chunk_end] = [mininum,mininum_index]
end
end

class Matrix
    #creat a randomly populaated matrix with the given dimensions
    def self.with_dimensions(rows,cols)
        a=[]
        rows.times{ a<< [];cols.times{ a[-1]<< rand(10)}}
        return Matrix[*a]
    end
    #create an array of
    #matrices that can be multiplied together
    def self.multipliable_chain(*rows)
        matrices = []
        0.upto(rows.size-2) do |i|
            matrices<< Matrix.with_dimensions(rows[i],rows[i+1])
        end  
        return matrices      
    end
    
end
chain = Matrix.multipliable_chain(100,20,10,1)
Matrix.multiply(*chain)

dimensions = []
10.times{ dimensions << rand(90)+10}
chain = Matrix.multipliable_chain(*dimensions)
require 'benchmark'
result_1 = nil
result_2 = nil
Benchmark.bm(11) do |b|
    b.report("Unoptimized") do 
        result_1 = chain[0]
        chain[1..chain.size].each{|c| result_1 *= c}
    end
    b.report("Optimized"){result_2 = Matrix.multiply(*chain)}
end