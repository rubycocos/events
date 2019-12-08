# encoding: utf-8


# 3rd party libs (gems)
require 'eventdb'
require 'fetcher'


# our own code

require 'whatson/version'      ## let version always go first


require 'whatson/tool'
require 'whatson/beerfest'   ## used by beerfest bin(ary) tool
require 'whatson/rubyconf'   ## used by rubyconf bin(ary) tool
require 'whatson/football'   ## used by kickoff bin(ary) tool





# say hello
puts WhatsOn.banner    if defined?($RUBYLIBS_DEBUG) && $RUBYLIBS_DEBUG
