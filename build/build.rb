# encoding: utf-8


PLANET_RUBY_ROOT = "../../planetruby"


require 'eventdb'     ## note: install use:
                      ##  $ gem install eventdb   (see github.com/textkit/event.db)
                      ## note: make sure sqlite3 is instaled too
                      ##  $ gem install sqlite3


r = EventDb::EventReader.from_file( "#{PLANET_RUBY_ROOT}/awesome-events/README.md" )
events = r.read

db = EventDb::MemDatabase.new
db.add( events )

cal = EventDb::EventCalendar.new
buf = cal.render( template: './templates/CALENDAR.md.erb' )
pp buf

### note: save calendar page and website repo (sibling repo)
File.open( "#{PLANET_RUBY_ROOT}/planetruby.github.io/calendar/index.md", 'w' ) do |f|
  f.write buf
end

buf = cal.render( template: './templates/rubyconf.json.erb' )
File.open( "#{PLANET_RUBY_ROOT}/rubyconf.json/rubyconf.json", 'w' ) do |f|
  f.write buf
end


puts 'Done.'
