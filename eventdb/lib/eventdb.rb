# encoding: utf-8

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

require 'eventdb/version'      ## let version always go first

require 'eventdb/schema'
require 'eventdb/models'

require 'eventdb/outline_reader'
require 'eventdb/reader'
require 'eventdb/calendar'   # note: depends (requires) models (first)
require 'eventdb/database'



# say hello
puts EventDb.banner    if defined?($RUBYCOCO_DEBUG) && $RUBYCOCO_DEBUG
