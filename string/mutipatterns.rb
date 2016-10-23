class String
    def mgsub(key_value_pairs=[].freeze)
        regexp_fragments = key_value_pairs.collect{|k,v| k}
        gsub(Regexp.union(*regexp_fragments)) do |match|
            key_value_pairs.detect{|k,v| k=~ match}[1]
        end
    end
end


#puts "GO HOME!".mgsub([[/.*GO/i,'Home'],[/home/i,'is where the heart is']])
#puts "here is number #123".mgsub([[/[a-z]/i,'#'],[/#/,'p']])

test_addresses = [
    'joe@example.com',
    'joe.bloggs@mail.example.com',
    'joe+ruby-mail@example.com',
    'joe(and-mary)@example.museum',
    'joe@localhost',
    'joe',
    'joe@',
    '@example.com',
    'joe@example@example.com',
    'joe and mary@example.com'
]

valid = '[^@]+'
username_and_machine = /^#{valid}@#{valid}$/


test_addresses.collect{|i| i=~ username_and_machine}
username_and_machine_with_tld= /^#{valid}@#{valid}\.#{valid}$/
test_addresses.collect{|i| i=~ username_and_machine_with_tld}

def probaly_valid?(email)
    valid='[A-Za-z\d.+-]+'
    if((email=~ /#{valid}@#{valid}\.#{valid}/)==0)
        puts email
    end
end
test_addresses.collect{|i| probaly_valid?(i)}

require 'resolv'
def valid_email_host?(email)
    hostname = email[(email=~ /@/)+1..email.length]
    valid = true
    begin
        Resolv::DNS.new.getresource(hostname,Resolv::DNS::Resource::IN::MX)

    rescue Resolv::ResolvError
        valid = false
    end
    return valid
end

puts valid_email_host?('joe@qq.cm')

