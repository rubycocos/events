
module WhatsOn

class Football < Tool

  def self.main()   new( ARGV ).list;   end


  def initialize( args=ARGV )
    args = ['https://github.com/footballbook/calendar/raw/master/README.md']  if args.empty?

    super( args,
           title:     'Upcoming Football Tournaments',
           more_link: 'github.com/footballbook/calendar',
           show_year: true    ## e.g. World Cup 2020 etc.
         )
  end
end # class Football

end # module WhatsOn
