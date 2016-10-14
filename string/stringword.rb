class String
    def word_count
        frequencies = Hash.new(0)
        swapcase.scan(/\w+/){|word| frequencies[word]+=1}
        return frequencies
    end

    def capitalize_first_letter
        self[0].chr.capitalize + self[1,size]
    end
    def capitalize_first_letter!
        unless self[0]==(c=self[0,1].upcase[0])
            self[0]=c
            self
        end
    end
end
puts ('abb'.respond_to?:to_str)
puts (4.respond_to?:to_str)

puts %{dogs dog dog odg dogs.}.word_count
puts "my ruby.and what about you".capitalize_first_letter
puts "my ruby.and what about you".slice(3,7)
puts "my ruby.and what about you"[0,2]
puts "my ruby.and what about you"[/b.*/]
