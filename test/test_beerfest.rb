# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_beerfest.rb


require 'helper'

class TestBeerFest < MiniTest::Test

  def test_list

    whatson = WhatsOn::BeerFest.new
    whatson.list
    whatson.list

    assert true  # assume ok if we get here
  end

end # class TestBeerFest
