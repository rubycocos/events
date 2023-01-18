
module WhatsOn

class BeerFest < Tool

  def self.main()   new( ARGV ).list;   end


  def initialize( args=ARGV )
    args = ['https://github.com/beerbook/calendar/raw/master/README.md']  if args.empty?

    super( args,
           title:     'Upcoming Beerfests',
           more_link: 'github.com/beerbook/calendar'
         )
  end
end # class BeerFest

end # module WhatsOn
