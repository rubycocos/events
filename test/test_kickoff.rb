# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_kickoff.rb


require 'helper'

class TestKickOff < MiniTest::Test

  def test_list

    whatson = WhatsOn::Football.new
    whatson.list
    whatson.list

    assert true  # assume ok if we get here
  end

end # class TestKickOff
