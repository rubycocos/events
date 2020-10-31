# encoding: utf-8

module WhatsOn

class PyCon < Tool

  def self.main()   new( ARGV ).list;   end


  def initialize( args=ARGV )
    args = ['https://github.com/python-organizers/conferences/raw/master/2020.csv']  if args.empty?

    super( args,
           title:     'Upcoming Python Conferences',
           more_link: 'github.com/python-organizers/conferences'
         )
  end
end # class PyCon

end # module WhatsOn
