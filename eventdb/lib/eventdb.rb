
# stdlibs
require 'pp'
require 'date'
require 'strscan'  ## StringScanner lib
require 'yaml'
require 'erb'

# 3rd party libs (gems)
require 'props'
require 'logutils'
require 'csvreader'

require 'props/activerecord'
require 'logutils/activerecord'


# our own code

require_relative 'eventdb/version'      ## let version always go first

require_relative 'eventdb/schema'
require_relative 'eventdb/models'

require_relative 'eventdb/outline_reader'
require_relative 'eventdb/reader'
require_relative 'eventdb/calendar'   # note: depends (requires) models (first)
require_relative 'eventdb/database'



# say hello
puts EventDb.banner    if defined?($RUBYCOCOS_DEBUG) && $RUBYCOCOS_DEBUG
