###
#  to run use
#     ruby -I ./lib  script/test_read.rb


## our own code
require 'eventdb'

puts EventDb::VERSION

events = EventDb::EventReader.read( "#{EventDb.root}/test/data/RUBY.md" )
# events = EventDb::EventReader.read( "#{EventDb.root}/test/data/conferences.yml" )
pp events



__END__

[#<struct EventDb::EventReader::Event
  title="Rails Rumble",
  link="https://railsrumble.com",
  place="Intertubes › Online",
  start_date=Sat, 18 Oct 2014,
  end_date=Sun, 19 Oct 2014>,
 #<struct EventDb::EventReader::Event
  title="JekyllConf",
  link="http://jekyllconf.com",
  place="Intertubes › Online",
  start_date=Sat, 02 May 2015,
  end_date=Sat, 02 May 2015>,
