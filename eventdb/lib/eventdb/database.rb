
module EventDb


class Database
  def initialize( config={} )
    @config = config
  end

  def connect
    ActiveRecord::Base.establish_connection( @config )
  end

  def create
    CreateDb.new.up
    ConfDb::Model::Prop.create!( key: 'db.schema.event.version', value: VERSION )
  end

  def create_all
    LogDb.create # add logs table
    ConfDb.create
    create
  end


  def read( path )   ## path_or_url
    events = EventReader.read( path )
    add( events )
  end

  def add( events )
    ## todo/fix: add check if Array and also allow single event
    ##  change arg to event_or_events - why? why not?

    ## todo/fix:   use attributes or to_hash or somehting that works with ActiveRecord and Struct objects - why? why not?

    events.each do |ev|
      Model::Event.create!(
          title:      ev.title,
          link:       ev.link,
          place:      ev.place,
          start_date: ev.start_date,
          end_date:   ev.end_date,
          ## note: (pre)calculate duration in days
          ##   -- mjd == Modified Julian Day Number
          ##   -- note: 0 = same day (end==start), thus always add plus one (for one day event)
          days:       ev.end_date.mjd - ev.start_date.mjd + 1
        )
    end
  end

end  ## class DatabaseBase


## convenience class for in-memory (SQLite3) database
class MemoryDatabase < Database

  def initialize
    ## -- default to sqlite3 in-memory database
    super( adapter:  'sqlite3',
           database: ':memory:' )

    ## step 1) (auto-)connect
    connect
    ## step 2) (auto-)migrate, that is, create tables, etc.
    create_all    # -- incl. props, logs tables etc.
  end

end # class Database

MemDatabase = MemoryDatabase
Memory      = MemoryDatabase

end # module EventDb
