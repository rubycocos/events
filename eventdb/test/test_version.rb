# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_version.rb


require 'helper'

class TestVersion < MiniTest::Test

  def test_version
    assert_equal EventDb::VERSION, EventDb.version
    assert true  # if we get here - test success
  end


end # class TestVersion
