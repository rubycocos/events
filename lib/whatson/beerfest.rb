# encoding: utf-8

module WhatsOn

class BeerFest

  def initialize
    ## turn down logger (default :debug?)
    LogUtils::Logger.root.level = :info

    r = EventDb::EventReader.from_url( "https://github.com/openbeer/calendar/raw/master/README.md" )
    events = r.read

    @db = EventDb::Database.new
    @db.add( events )
  end
  
  def print
    ## get next 17 events
    
    today = Date.today

    up = EventDb::Model::Event.limit( 17 ).upcoming( today )

    ## pp up.to_sql
    ## pp up

    puts ''
    puts ''
    puts "Upcoming Beerfests:"
    puts ''

    on = EventDb::Model::Event.live( today )
    on.each do |e|
      current_day = today.mjd - e.start_date.mjd + 1   ## calculate current event day (1,2,3,etc.) 
      puts "  NOW ON #{current_day}d    #{e.title} #{e.start_date.year}, #{e.date_str} (#{e.days}d) @ #{e.place}"
    end

    puts '' if on.any?

    up.each do |e|
      diff_days = e.start_date.mjd - today.mjd   ## note: mjd == Modified Julian Day Number 
      puts "  in #{diff_days}d  #{e.title}, #{e.date_str} (#{e.days}d) @ #{e.place}"
    end
    puts ''
    puts "    More @ github.com/openbeer/calendar"
    puts ''
  end

end # class BeerFest

end # module WhatsOn
