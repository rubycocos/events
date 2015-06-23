# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_rubyconf.rb


require 'helper'

class TestRubyConf < MiniTest::Test

  def test_print
    
    r = WhatsOn::RubyConf.new
    r.print
    r.print
    
    assert true  # assume ok if we get here
  end

end # class TestRubyConf
