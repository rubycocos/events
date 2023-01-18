

module WhatsOn

class RubyConf < Tool

  def self.main()   new( ARGV ).list;   end


  def initialize( args=ARGV )
    args = ['https://github.com/planetruby/conferences/raw/master/_data/conferences2023.yml']  if args.empty?

    super( args,
           title:     'Upcoming Ruby Conferences',
           more_link: 'github.com/planetruby/calendar'
         )
  end
end # class RubyConf

end # module WhatsOn
