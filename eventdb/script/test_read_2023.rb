###
#  to run use
#     ruby -I ./lib  script/test_read_2023.rb


## our own code
require 'eventdb'

puts EventDb::VERSION

events = EventDb::EventReader.read( "./script/conferences2023.yml" )
pp events



