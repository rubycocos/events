# encoding: utf-8

module WhatsOn

class RubyConf < Tool

  def self.main()   new( ARGV ).list;   end


  def initialize( args=ARGV )
    args = ['https://github.com/planetruby/calendar/raw/master/_data/conferences2020.yml']  if args.empty?

    super( args,
           title:     'Upcoming Ruby Conferences',
           more_link: 'github.com/planetruby/calendar'
         )
  end
end # class RubyConf

end # module WhatsOn
