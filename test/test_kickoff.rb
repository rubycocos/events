# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_kickoff.rb


require 'helper'

class TestKickOff < MiniTest::Test

  def test_print

    r = WhatsOn::Football.new
    r.print
    r.print

    assert true  # assume ok if we get here
  end

end # class TestKickOff
