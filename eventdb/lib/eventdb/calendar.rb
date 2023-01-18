
module EventDb

class EventCursor
  def initialize( events )
    @events = events
  end

  def each
    state = State.new
    @events.each do |event|
       state.next( event )
       yield( event, state )
    end
  end

  class State
    def initialize
      @last_date  = Date.new( 1971, 1, 1 )
      @new_date   = true
      @new_year   = true
      @new_month  = true
    end
    def new_date?()  @new_date; end
    def new_year?()  @new_year; end
    def new_month?() @new_month; end

    def next( event )
      if @last_date.year  == event.start_date.year &&
         @last_date.month == event.start_date.month
           @new_date  = false
           @new_year  = false
           @new_month = false
      else
        @new_date = true
        ## new year?
        @new_year  = @last_date.year != event.start_date.year ? true : false
        ## new_month ?
        @new_month = (@new_year == true || @last_date.month != event.start_date.month) ? true : false
      end
      @last_date = event.start_date
    end

  end # class State

end # class EventCursor


class EventCalendar

  include Models   # e.g. lets you use Event instead of (EventDb::)Model::Event

  def initialize( opts={} )
    @events    = opts[:events] || Event.order('start_date DESC')   ## sort events by date (newest first)
  end

  def events
    ## note: return new cursor  -- use decorator (instead of extra loop arg, why? why not?
    EventCursor.new( @events )
  end

  def render( opts={} )
    tmpl_path  = opts[:template] || './templates/CALENDAR.md.erb'
    tmpl       = File.open( tmpl_path, 'r:utf-8' ).read

    ERB.new( tmpl, nil, '<>' ).result( binding )   # <> omit newline for lines starting with <% and ending in %>
  end

#  def save( path = './CALENDAR.md' )   ## use (rename to) save_as - why? why not??
#    File.open( path, 'w' ) do |f|
#      f.write( render )
#    end
#  end

end # class EventCalendar

end # module EventDb
