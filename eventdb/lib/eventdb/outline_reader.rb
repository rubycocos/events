# encoding: utf-8

module EventDb

  class OutlineReader

    def self.read( path )   ## use - rename to read_file or from_file etc. - why? why not?
      txt = File.open( path, 'r:utf-8' ).read
      parse( txt )
    end


    HEADING_RE =  /^(\#{1,})       ## leading ####
                    ([^#]+?)       ##  text - note: use non-greedy e.g. +?
                    \#*            ## (optional) trailing ##
                   $/x

    LISTITEM_RE = /^  \s*
                     -\s+        ## space required after dash (-)
                     (.+)          ## text
                    $/x



    def self.parse( txt )
      outline=[]   ## outline structure

      # note: cut out; remove all html comments e.g. <!-- -->
      #   supports multi-line comments too (e.g. uses /m - make dot match newlines)
      txt = txt.gsub( /<!--
                         .+?
                        -->/xm, '' )    ## todo/fix: track/log cut out comments!!!


      txt.each_line do |line|
          line = line.strip      ## todo/fix: keep leading and trailing spaces - why? why not?

          next if line.empty?    ## todo/fix: keep blank line nodes e.g. just remove comments and process headings?! - why? why not?
          break if line == '__END__'

          pp line

           ## note:  all optional trailing ### too
          if HEADING_RE.match( line )
             heading_marker = $1
             heading_level  = $1.length   ## count number of = for heading level
             heading        = $2.strip

             puts "heading #{heading_level} >#{heading}<"
             outline << [:"h#{heading_level}", heading]
          elsif LISTITEM_RE.match( line )
             item =  $1.strip

             puts "list item >#{item}<"
             outline << [:li, item]
          else
             ## assume it's a (plain/regular) text line
             outline << [:l, line]
          end
      end
      outline
    end # method read
  end # class OutlineReader

  end # module EventDb
