# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_parser.rb


require 'helper'

class TestParser < MiniTest::Test

  def test_ruby_markdown
txt =<<TXT
# Awesome Events

## Online

<!-- try classic format -->

- [Rails Rumble](https://railsrumble.com)
    - 2014 @ Intertubes; Oct/18+19

<!-- try modern format -->

- **JekyllConf** (web: [jekyllconf.com](http://jekyllconf.com))
    - 2015 @ Intertubes; May/2
TXT

    events = EventDb::EventReader::MarkdownParser.parse( txt )

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

  def test_ruby_yaml
txt =<<TXT
# Awesome Events

- name:     Rails Rumble
  url:      https://railsrumble.com
  location: Intertubes, Online
  start:    2014-10-18
  end:      2014-10-19

- name:     JekyllConf
  url:      http://jekyllconf.com
  location: Intertubes, Online
  start:    2015-05-02
  end:      2015-05-02
TXT

    events = EventDb::EventReader::YamlParser.parse( txt )

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

  def test_ruby_yaml_ii
  ## use variants e.g. start_date/end_date (instead of start/end)
txt =<<TXT
# Awesome Events

- name:       Rails Rumble
  url:        https://railsrumble.com
  location:   Intertubes, Online
  start_date: 2014-10-18
  end_date:   2014-10-19

- name:       JekyllConf
  url:        http://jekyllconf.com
  location:   Intertubes, Online
  start_date: 2015-05-02
  end_date:   2015-05-02
TXT

    events = EventDb::EventReader::YamlParser.parse( txt )

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
end # class TestParser
