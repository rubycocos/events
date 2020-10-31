# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_calendar.rb


require 'helper'

class TestCalendar < MiniTest::Test

  def test_ruby
    db = EventDb::Memory.new
    db.read( "#{EventDb.root}/test/data/RUBY.md" )

    cal = EventDb::EventCalendar.new
    buf = cal.render( template: "#{EventDb.root}/test/templates/RUBY.md.erb" )
    puts buf

    start_buf =<<TXT
# Ruby Conference Calendar

NOTE: This page gets auto-generated from the [awesome-events](README.md) page @ Planet Ruby.
(Last update on #{Date.today}.) Do NOT edit this page, please update or edit conferences, camps, meetups etc.
on the [awesome-events](README.md) page. Anything missing? Contributions welcome. Thanks!


[2016](#2016) • [2015](#2015) • [2014](#2014)  • [2013](#2013)


## 2016


**May**


May/4-6 • [**RailsConf**](http://railsconf.com) @ Kansas City, Missouri, United States, North America, America

## 2015


**December**
TXT

   assert_equal start_buf, buf[0...start_buf.size]

  end # method test_ruby

end # class TestCalendar
