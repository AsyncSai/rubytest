class Thing
    def initialize(name,des)
        @name = name
        @des = des
    end
end

class SubThing < Thing
    def initialize(aName,aDes)
        super(aName,aDes) #passes name and des to superclass
    end

    def description
        return @des
    end

    def description=(ades)
        @des=ades
    end

    def set_description(ades)
        @des=ades
    end
end

t1 = SubThing.new("me","super coder man")
puts t1.description
t1.set_description("#{t1.description} hahaha")
puts t1.description

puts('dowhat')
dowhat = gets() #"写静态页面" 
puts('profession')
profession = gets() #"前端工程师"
puts('cansay')
cansay = gets() #"说他不帅"
puts('cannotsay')
cannotsay=gets() #"说他头发短"
template = "每次#{dowhat}都是有它的难度，有它的复杂性，为什么这么制作，也是有原因的。请大家尊重#{profession}，你们可以#{cansay}，但是不能#{cannotsay}"
puts template