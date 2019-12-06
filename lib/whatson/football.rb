# encoding: utf-8

module WhatsOn

class Football

  def initialize
    ## turn down logger (default :debug?)
    LogUtils::Logger.root.level = :info

    @db = EventDb::Memory.new     ## note: use in-memory SQLite database
    @db.read( "https://github.com/footballbook/calendar/raw/master/README.md" )
  end

  def print
    ## get next 17 events

    today = Date.today

    up = EventDb::Model::Event.limit( 17 ).upcoming( today )
    ## pp up.to_sql
    ## pp up


    puts ''
    puts ''
    puts "Upcoming Football Tournaments:"
    puts ''

    on = EventDb::Model::Event.live( today )
    on.each do |e|
      puts "  NOW ON #{e.current_day(today)}d    #{e.title} #{e.start_date.year}, #{e.date_fmt} (#{e.days}d) @ #{e.place}"
    end

    puts '' if on.any?

    up.each do |e|
      puts "  in #{e.diff_days(today)}d  #{e.title} #{e.start_date.year}, #{e.date_fmt} (#{e.days}d) @ #{e.place}"
    end
    puts ''
    puts "    More @ github.com/footballbook/calendar"
    puts ''
  end

end # class Football

end # module WhatsOn
