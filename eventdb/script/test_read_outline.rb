###
#  to run use
#     ruby -I ./lib  script/test_read_outline.rb


## our own code
require 'eventdb'

puts EventDb::VERSION

nodes = EventDb::OutlineReader.read( "#{EventDb.root}/test/data/RUBY.md" )
pp nodes
