require 'date'
class Date
    def Date.now
        return Date.jd(DateTime.now.jd)
    end
end
TRY_FORMATS = ['%y/%d/%m','%y %d %m']
def try_to_parse(s)
    parsed = nil
    TRY_FORMATS.each do |format|
        begin
            parsed = Date.strptime(s,format)
        rescue  ArgumentError
        end
    end
    return parsed
end
class Time
    def day_ordinal_suffix
        if day == 11 or day == 12
            return 'th'
        else
            case day % 10
            when 1 then return 'st'
            when 2 then return 'nd'
            when 3 then return 'rd'
            else return 'th'
            end
        end
    end
end
american_date = '%y/%d/%m'
puts DateTime.new.to_s,now1=DateTime::now,
    now = Date.now,
    Time.local(1999,12,31,23,21,5,1044),
    Date.parse('2/9/2007').to_s,
    Date.strptime('2/9/07',american_date),
    DateTime.strptime('2/9/07',american_date).to_s,
    try_to_parse('2007 1 10'),
    Time.now.strftime("the %e#{Time.now.day_ordinal_suffix} of %B")

(Date.new(1776,7,2)..Date.new(1776,7,4)).each {|x| puts x}

class Time
    def step(other_time,increment)
        raise ArgumentError,"step can't be 0" if increment == 0
        increasing = self < other_time
        if (increasing && increment < 0)||(!increasing && increment > 0)
            yield self
            return
        end
        d = self
        begin
            yield d
            d += increment
         end      while (increasing ? d <= other_time : d >= other_time)        
    
    end
    def upto(other_time)           
        step(other_time,1){ |x| yield x}
    end   
end

the_first = Time.local(2004,1,1)
the_second = Time.local(2004,1,2)
the_first.step(the_second,60*60*6){ |x| puts x}