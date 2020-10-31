# encoding: utf-8

###
#  to run use
#     ruby -I ./lib  script/test_memory.rb


## our own code
require 'eventdb'

db = EventDb::Memory.new
db.read( "#{EventDb.root}/test/data/conferences.yml" )

today = Date.today

puts 'Upcoming Ruby Conferences:'
puts ''

on = EventDb::Model::Event.live( today )
on.each do |e|
  puts "  NOW ON #{e.current_day(today)}d    #{e.title}, #{e.date_fmt} (#{e.days}d) @ #{e.place}"
end

puts '' if on.any?

up = EventDb::Model::Event.limit( 17 ).upcoming( today )
up.each do |e|
  puts "  in #{e.diff_days(today)}d  #{e.title}, #{e.date_fmt} (#{e.days}d) @ #{e.place}"
end
