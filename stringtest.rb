ERB#run

template = %q{
    <% if problems.empty? %>
    Looks like your code is clean!
    <% else %>
    problems with
    <% problems.each do |problen,line| %>
        * <%= problen %> on line <%= line %>
    <% end %>
    <% end %>}.gsub(/^\s+/,'')

template = ERB.new(template,nil,'<>')

problems = [["use of is_a?instead of duck typing",23],
            ["eval() is usually dangerous",44]]
template.run(binding)