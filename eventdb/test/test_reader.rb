# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_reader.rb


require 'helper'

class TestReader < MiniTest::Test

  def test_datafiles
    events = EventDb::EventReader.read( "#{EventDb.root}/test/data/test.txt" )
    pp events
  end

  def test_markdown
    events = EventDb::EventReader.read( "#{EventDb.root}/test/data/RUBY.md" )

    ## pp events
    ev = events[0]

    assert_equal 'Rails Rumble',            ev.title
    assert_equal 'https://railsrumble.com', ev.link
    assert_equal 'Intertubes, Online',      ev.place
    assert_equal Date.new(2014,10,18),      ev.start_date
    assert_equal Date.new(2014,10,19),      ev.end_date


    ev = events[1]

    assert_equal 'JekyllConf',              ev.title
    assert_equal 'http://jekyllconf.com',   ev.link
    assert_equal 'Intertubes, Online',      ev.place
    assert_equal Date.new(2015,5,2),        ev.start_date
  end

  def test_csv
    rows =  CsvHash.read( "#{EventDb.root}/test/data/conferences.csv", :header_converters => :symbol )
    pp rows

    events = EventDb::EventReader.read( "#{EventDb.root}/test/data/conferences.csv" )

    ## pp events
    ev = events[0]

    assert_equal 'PyCascades',                                 ev.title
    assert_equal 'https://2020.pycascades.com',                ev.link
    assert_equal 'Portland, Oregon, United States of America', ev.place
    assert_equal Date.new(2020, 2, 8),                         ev.start_date
    assert_equal Date.new(2020, 2, 9),                         ev.end_date

    ev = events[1]

    assert_equal 'PyCon Namibia',          ev.title
    assert_equal 'https://na.pycon.org/',  ev.link
    assert_equal 'Windhoek, Namibia',      ev.place
    assert_equal Date.new(2020, 2, 18),    ev.start_date
    assert_equal Date.new(2020, 2, 20),    ev.end_date
  end

end # class TestReader
