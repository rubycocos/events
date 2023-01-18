
require 'yaml'
require 'date'
require 'time'

## see https://github.com/ruby/psych/issues/262  and
##     http://sundivenetworks.com/archive/2021/tried-to-load-unspecified-class-time-psych-disallowedclass.html
##     https://makandracards.com/makandra/465149-ruby-the-yaml-safe_load-method-hides-some-pitfalls
##    about the issues with parsing dates in yml
##   workaround 1) - use quotes for dates as string
##

##
## Psych#safe_load only whitelists the following classes:
##    TrueClass, FalseClass, NilClass, Numeric, String, Array and Hash.
## All other classes will raise an exception unless you whitelist them. Maybe it is a good idea to add Symbol, Date and Time to that list, but other classes could also make sense.


txt = File.open( './sandbox/conferences2023.yml'){ |f| f.read }
pp txt
puts

data = Psych.safe_load( txt, permitted_classes: [Date] )
pp data


puts "Psych.libyaml_version:"
pp Psych.libyaml_version


puts "bye"