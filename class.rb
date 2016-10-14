class Dog
    def set_name(aName)
        @myname = aName
        #puts aName
        puts self
        puts self.class
    end

    def get_name
        return @myname
    end

    def talk

        return 'woof!'

    end

    def initialize(aName,aDescription)
        @name = aName
        @decription =aDescription
    end

end



    puts(Class.to_s)

    t = Dog.new("Sword","a lovely elvish weapon")
    puts t.to_s
    puts t.inspect