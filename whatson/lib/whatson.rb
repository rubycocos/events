# encoding: utf-8


# 3rd party libs (gems)
require 'eventdb'
require 'fetcher'


# our own code

require 'whatson/version'      ## let version always go first


require 'whatson/tool'
require 'whatson/beerfest'   ## used by beerfest bin(ary) tool
require 'whatson/pycon'      ## used by pyocn bin(ary) tool
require 'whatson/rubyconf'   ## used by rubyconf bin(ary) tool
require 'whatson/football'   ## used by kickoff bin(ary) tool
require 'whatson/whatson'    ## used by whatson bin(ary) tool




# say hello
puts WhatsOn.banner    if defined?($RUBYCOCO_DEBUG) && $RUBYCOCO_DEBUG
