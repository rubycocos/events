
module WhatsOn

class WhatsOn < Tool

  def self.main()   new( ARGV ).list;   end


  def initialize( args=ARGV )
    args = ['https://github.com/planetruby/conferences/raw/master/_data/conferences2023.yml',
            'https://github.com/python-organizers/conferences/raw/main/2023.csv',
           ]   if args.empty?

    super( args,
           title:     'Upcoming Events',
           more_link: 'github.com/rubycocos/events/tree/master/whatson#public-event-datasets'
         )
  end
end # class WhatsOn
end # module WhatsOn
