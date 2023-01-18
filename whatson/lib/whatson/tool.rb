
module WhatsOn


## base (shared) tool class
class Tool

  ## todo/fix:  use header, footer instead of title, more_link - why? why not?

  Config = Struct.new( :title,         ## todo/change:  find better names for config params - why? why not?
                       :more_link,
                       :show_year )

  def initialize( args=ARGV,
                  title:       'Upcoming Events',
                  more_link:   nil,
                  show_year:   false
                )
    ## turn down logger (default :debug?)
    LogUtils::Logger.root.level = :info

    @config =  Config.new( title,
                           more_link,
                           show_year )

    @db = EventDb::Memory.new    ## note: use in-memory SQLite database
    args.each do |arg|
      puts "  reading >#{arg}<..."
      @db.read( arg )
    end
  end


  def list   ## note: use list and NOT print (otherwise built-in call to print is recursive and will crash!!!)
    today = Date.today

    puts ''
    puts ''
    puts "#{@config.title}:"
    puts ''

    on = EventDb::Model::Event.live( today )
    on.each do |e|
      print "  NOW ON #{e.current_day(today)}d    "
      print "#{e.title}"
      print " #{e.start_date.year}"     if @config.show_year
      print ", "
      print "#{e.date_fmt} (#{e.days}d) @ #{e.place}"
      print "\n"
    end

    puts '' if on.any?

    ## get next 17 events
    up = EventDb::Model::Event.limit( 17 ).upcoming( today )
    ## pp up.to_sql
    ## pp up

    if up.count > 0
      up.each do |e|
        print "  in #{e.diff_days(today)}d  "
        print "#{e.title}"
        print " #{e.start_date.year}"     if @config.show_year
        print ", "
        print "#{e.date_fmt} (#{e.days}d) @ #{e.place}"
        print "\n"
      end
    else
      puts "  -- No upcoming events found. #{EventDb::Model::Event.count} past event(s) in database. --"
    end

    puts ''

    if @config.more_link
      puts "    More @ #{@config.more_link}"
      puts ''
    end
  end

end # class Tool

end # module WhatsOn
