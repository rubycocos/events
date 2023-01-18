

module EventDb


class EventReader

  Event = Struct.new( :title, :link,
                      :place,
                      :start_date, :end_date )


  def self.read( path )
    txt = if path.start_with?( 'http://' ) ||
             path.start_with?( 'https://' )
               worker = Fetcher::Worker.new
               worker.read_utf8!( path )
          else
               File.open( path, 'r:utf-8' ).read
          end

    parser = if path.end_with?( '.yml') ||
                path.end_with?( '.yaml')
                  YamlParser.new( txt )
             elsif path.end_with?( '.csv')
                  CsvParser.new( txt )
             elsif path.end_with?( '.txt')
                  DatafileParser.new( txt )
             else
                  MarkdownParser.new( txt )
             end
    parser.parse
  end


class DatafileParser
  def self.parse( text )  new( text ).parse; end

  include LogUtils::Logging

  def initialize( text )
    @text = text
  end

  def parse
    events = []

    @text.each_line do |line|
       line = line.strip
       next if line.empty?               ## skip empty lines
       next if line.start_with?( '#')    ## skip comment lines

       ## todo/check: add inline comments too - why? why not?

       puts "    reading >#{line}<..."
       events += EventReader.read( line )
    end

    events
  end
end  # class DatafileParser


class CsvParser
  def self.parse( text )  new( text ).parse; end


  include LogUtils::Logging

  def initialize( text )
    @text = text
  end

  def parse
    events = []
    recs = CsvHash.parse( @text, :header_converters => :symbol )

    ## note:
    ##   support python's conferences.csv
    ##   subject     =>  name / title
    ##   website_url =>  url / link

    recs.each do |rec|
      title      = rec[:name]     || rec[:title] || rec[:subject]
      link       = rec[:url]      || rec[:link]  || rec[:website_url]
      place      = rec[:location] || rec[:place]

      start_date = Date.strptime( rec[:start] || rec[:start_date], '%Y-%m-%d' )
      end_date   = Date.strptime( rec[:end]   || rec[:end_date],   '%Y-%m-%d' )

      event = Event.new( title, link,
                         place,
                         start_date, end_date )
      ## pp event

      events << event
    end

    events
  end
end # class CsvParser


class YamlParser
  def self.parse( text )  new( text ).parse; end


  include LogUtils::Logging

  def initialize( text )
    @text = text
  end

  def parse
    events = []
    ## fix:  unquoted dates e.g. 2022-11-27  no longer supported!!
    ##         with YAML.safe_load
    ##
    ## quick fix:  assume Pysch yaml parser
    ##   and allow Date!!!
    recs = YAML.load( @text, permitted_classes: [Date] )

    recs.each do |rec|
      title      = rec['name']     || rec['title']
      link       = rec['url']      || rec['link']
      place      = rec['location'] || rec['place']

      # note: already parsed into a date (NOT string) by yaml parser!!
      start_date = rec['start']    || rec['start_date']
      end_date   = rec['end']      || rec['end_date']

      event = Event.new( title, link,
                         place,
                         start_date, end_date )
      ## pp event

      events << event
    end

    events
  end
end # class YamlReader


class MarkdownParser
  def self.parse( text )  new( text ).parse; end


  include LogUtils::Logging

  def initialize( text )
    @text = text
  end

  MONTH_EN_TO_MM = {
        'Jan' => '1',
        'Feb' => '2',
        'Mar' => '3', 'March' => '3',
        'Apr' => '4', 'April' => '4',
        'May' => '5',
        'Jun' => '6', 'June' => '6',
        'Jul' => '7', 'July' => '7',
        'Aug' => '8',
        'Sep' => '9', 'Sept' => '9',
        'Oct' => '10',
        'Nov' => '11',
        'Dec' => '12' }

  MONTH_EN = MONTH_EN_TO_MM.keys.join('|')  # e.g. 'Jan|Feb|March|Mar|...'

## examples:
## - 2015 @ Salzburg, Austria; Oct/17+18
## - 2015 @ Brussels / Brussel / Bruxelles; Jan/31+Feb/1
## - 2014 @ Porto de Galinhas, Pernambuco; Apr/24-27 (formerly: Abril Pro Ruby)

  DATE_ENTRY_RE = /(?<year>20\d\d)   ## year
                      \s+
                       @            ## at location
                      \s+
                      [^;]+        ##  use ; as separator between place and date
                      ;
                      \s+
                      (?<start_month_en>#{MONTH_EN})
                      \/
                      (?<start_day>[0-9]{1,2})          ## start date
                      (?:
                        [+\-]     ## use + for two days, - for more than two days
                        (?:
                          (?<end_month_en>#{MONTH_EN})
                          \/
                        )?   ## optional end_month
                        (?<end_day>[0-9]{1,2})
                      )? ## optional end_date
                      /x


## example:
## - [RubyWorld Conference - rubyworldconf](http://www.rubyworld-conf.org/en)

  LINK_ENTRY_RE = /\[
                         [^\]]+
                       \]
                       \(
                        [^\)]+
                       \)
                     /x



  def parse
    events = []
    stack  = []   ## header/heading stack;  note: last_stack is stack.size; starts w/ 0

    last_link_entry = nil


    nodes = OutlineReader.parse( @text )
    nodes.each do |node|

      if [:h1,:h2,:h3,:h4,:h5,:h6].include?( node[0] )
        heading = node[1]
        #  stop when hitting >## More< or <Calendar> or <Thanks> etc. section
        #   note: must escape # e.g. #{2,} must be escaped to \#{2,}
        break if heading =~ /^(More|Calendar|Thanks|Meta)\b/

        # skip "pseudo" headings (for contribs etc.)
        ##  e.g. #### _Contributions welcome. Anything missing? Send in a pull request. Thanks._
        next if heading =~ /Contributions welcome\.|Anything Missing\?/


        level = node[0][1].to_i

          logger.debug " heading level: #{level}, title: >#{heading}<"

          level_diff = level - stack.size

          if level_diff > 0
            logger.debug "[EventReader]    up  +#{level_diff}"
            if level_diff > 1
              logger.error "fatal: level step must be one (+1) is +#{level_diff}"
              fail "[EventReader] level step must be one (+1) is +#{level_diff}"
            end
          elsif level_diff < 0
            logger.debug "[EventReader]    down #{level_diff}"
            level_diff.abs.times { stack.pop }
            stack.pop
          else
            ## same level
            stack.pop
          end
          stack.push( [level, heading] )
          logger.debug "  stack: #{stack.inspect}"

      elsif [:li].include?( node[0] )    ## list item
        line = node[1]

        if LINK_ENTRY_RE.match( line )
          logger.debug " link entry: #{line}"

          last_link_entry = line
        elsif m=DATE_ENTRY_RE.match( line )
          year           = m[:year]

          start_month_en = m[:start_month_en]
          start_day      = m[:start_day]

          start_month    = MONTH_EN_TO_MM[ start_month_en ]
          start_date = Date.new( year.to_i, start_month.to_i, start_day.to_i )


          end_month_en   = m[:end_month_en]
          end_month_en    = start_month_en    if end_month_en.nil? # no end month; use same as start

          end_day        = m[:end_day]
          end_day        = start_day   if end_day.nil?  # no end day; single day event (use start day)

          end_month     = MONTH_EN_TO_MM[ end_month_en ]
          end_date = Date.new( year.to_i, end_month.to_i, end_day.to_i )

          ## pp start_date

          logger.debug " date entry: #{line}"
          logger.debug "   start_date: #{start_date}, year: #{year}, start_month_en: #{start_month_en}, start_month: #{start_month} start_day: #{start_day} => #{last_link_entry}"
          logger.debug "   end_date: #{end_date}, end_month_en: #{end_month_en}, end_day_en: #{end_day}"


          s = StringScanner.new( line )
          s.skip_until( /@/ )

          place = s.scan( /[^;]+/ ) ## get place (everything until ; (separator))
          place = place.strip
          logger.debug "  place: #{place}, rest: >#{s.rest}<"

          ## todo/fix: make place uniform e.g. change
          ##    Vienna, Austria  =>
          ##    Vienna › Austria       - why? why not?

          ## note: cut of heading 1 (e.g. page title)
          more_places = stack[1..-1].reverse.map {|it| it[1] }.join(', ')     ## was: join(' › ')
          place = "#{place}, #{more_places}"
          logger.debug "  place: #{place}"


          title, link = find_title_and_link( last_link_entry )


          event = Event.new( title, link,
                             place,
                             start_date, end_date )
          ## pp event

          events << event
        else
          logger.debug "  *** skip list item line: #{line}"
        end
      else
        logger.debug "  *** skip node:"
        pp node
      end
    end

    events
  end

### helper
def find_title_and_link( line )
  title = nil
  link  = nil

    ## note: extract title and link from line

    ### 1) try "new" format first e.g.
    ##    - **European Ruby Konference - EuRuKo** (web: [euruko.org](http://euruko.org), t: [euruko](https://twitter.com/euruko)) - _since 2003_
    if m = (line =~ /^\*{2}([^*]+)\*{2}/)   ## note: **title** must start line
      title = $1
      puts "  adding (new/modern format) => #{title}"
    ## 2) try "old" classic format - get title from first (markdown) link e.g.
    ##   - [Oktoberfest ("Die Wiesn")](http://www.muenchen.de/veranstaltungen/oktoberfest.html)
    elsif m = (line =~ /^\[([^\]]+)\]/)    ## note: [title](link) must start line
      title = $1
      puts "  adding (old/classic format) => #{title}"
    else
      puts "*** !! ERROR !!: cannot find event title in #{line}"
      exit 1
    end

    ## try extract link - use first (markdown) link
    ##   todo/fix: use shared markdown link regex!!!!!
    if m = (line =~ /\[[^\]]+\]\(([^\)]+)\)/)
      link = $1
      puts "                               => @ #{link}"
    else
      link = nil
      puts "*** !! WARN !!: cannot find event link in #{line}"
    end

    [title,link]
end # method find_title_and_link
end # class MarkdownReader

end  # class EventReader
end # module EventDb
