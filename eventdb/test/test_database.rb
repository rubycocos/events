# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_database.rb


require 'helper'

class TestDatabase < MiniTest::Test

  def test_ruby
    db = EventDb::Memory.new
    db.read( "#{EventDb.root}/test/data/RUBY.md" )

    ## get next 17 events
    today = Date.new( 2015, 1, 1 )
    up = EventDb::Model::Event.limit( 17 ).upcoming( today )
    pp up.to_sql
    pp up

    puts "Upcoming Ruby Conferences:"
    up.each do |e|
      puts "  #{e.date_fmt('short')} | #{e.date_fmt} - #{e.title} @ #{e.place}"
    end

    assert true  # assume ok if we get here
  end

end # class TestDatabase
