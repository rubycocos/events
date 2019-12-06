# encoding: utf-8

module WhatsOn

class RubyConf

  def initialize
    ## turn down logger (default :debug?)
    LogUtils::Logger.root.level = :info

    @db = EventDb::Memory.new    ## note: use in-memory SQLite database
    @db.read( "https://github.com/planetruby/calendar/raw/master/_data/conferences2020.yml" )
  end

  def print
    ## get next 17 events

    today = Date.today

    up = EventDb::Model::Event.limit( 17 ).upcoming( today )
    ## pp up.to_sql
    ## pp up

    puts ''
    puts ''
    puts "Upcoming Ruby Conferences:"
    puts ''

    on = EventDb::Model::Event.live( today )
    on.each do |e|
      puts "  NOW ON #{e.current_day(today)}d    #{e.title}, #{e.date_fmt} (#{e.days}d) @ #{e.place}"
    end

    puts '' if on.any?

    up.each do |e|
      puts "  in #{e.diff_days(today)}d  #{e.title}, #{e.date_fmt} (#{e.days}d) @ #{e.place}"
    end
    puts ''
    puts "    More @ github.com/planetruby/calendar"
    puts ''
  end

end # class RubyConf

end # module WhatsOn
