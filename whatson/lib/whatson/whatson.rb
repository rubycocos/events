# encoding: utf-8

module WhatsOn

class WhatsOn < Tool

  def self.main()   new( ARGV ).list;   end


  def initialize( args=ARGV )
    args = ['https://github.com/planetruby/calendar/raw/master/_data/conferences2020.yml',
            'https://github.com/python-organizers/conferences/raw/master/2020.csv',
           ]   if args.empty?

    super( args,
           title:     'Upcoming Events',
           more_link: 'github.com/textkit/whatson#public-event-datasets'
         )
  end
end # class WhatsOn
end # module WhatsOn
