# 3rd party libs (gems)
require 'eventdb'
require 'fetcher'


# our own code

require_relative 'whatson/version'      ## let version always go first


require_relative 'whatson/tool'
require_relative 'whatson/beerfest'   ## used by beerfest bin(ary) tool
require_relative 'whatson/pycon'      ## used by pyocn bin(ary) tool
require_relative 'whatson/rubyconf'   ## used by rubyconf bin(ary) tool
require_relative 'whatson/football'   ## used by kickoff bin(ary) tool
require_relative 'whatson/whatson'    ## used by whatson bin(ary) tool




# say hello
puts WhatsOn.banner    if defined?($RUBYCOCOS_DEBUG) && $RUBYCOCOS_DEBUG
