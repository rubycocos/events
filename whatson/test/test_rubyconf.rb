###
#  to run use
#     ruby -I ./lib -I ./test test/test_rubyconf.rb


require 'helper'

class TestRubyConf < MiniTest::Test

  def test_list

    whatson = WhatsOn::RubyConf.new
    whatson.list
    whatson.list

    assert true  # assume ok if we get here
  end

end # class TestRubyConf
