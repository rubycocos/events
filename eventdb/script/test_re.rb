require 'pp'


HEADING_RE =  /^(\#{1,})       ## leading ####
                ([^#]+?)       ##  text
                \#*            ## (optional) trailing ##
               $/x

pp HEADING_RE


lines = ["# Heading 1",
         "# Heading 1 ##",
         "## Heading 2",
         "### Heading 3",
        ]

lines.each do |line|
  if m=HEADING_RE.match( line )
    puts "bingo!! matching >#{line}<"
    pp m
  else
    puts "no match found >#{line}<"
  end
end
