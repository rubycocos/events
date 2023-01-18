# whatson

what's on now command line tool (using the event.db machinery)

* home  :: [github.com/textkit/whatson](https://github.com/textkit/whatson)
* bugs  :: [github.com/textkit/whatson/issues](https://github.com/textkit/whatson/issues)
* gem   :: [rubygems.org/gems/whatson](https://rubygems.org/gems/whatson)
* rdoc  :: [rubydoc.info/gems/whatson](http://rubydoc.info/gems/whatson)
* forum :: [ruby-talk@ruby-lang.org](http://www.ruby-lang.org/en/community/mailing-lists)


## Command Line Tools - `rubyconf`, `pycon`, `kickoff`, `beerfest`

The whatson package includes command line tools
to list upcoming events (ruby conferences, python conferences,
football tournaments, beer festivals. etc.).


### Upcoming Ruby Conferences

Use

```
$ rubyconf
```

to list upcoming Ruby (un)conferences from around the world. Will print in 2023:

```
Upcoming Ruby Conferences:

  in 33d   RubyConf Australia, Mon+Tue Feb/20+21 (2d) @ Melbourne, Australia
  in 96d   RailsConf (United States), Mon-Wed Apr/24-26 (3d) @ Atlanta, Georgia, United States
  in 113d  RubyKaigi, Thu-Sat May/11-13 (3d) @ Nagano, Japan
  in 162d  Punk's Not Dead Conf - Ruby (Pixel) Art Programming, Thu+Fri Jun/29+30 (2d) @ Vienna, Austria
  ...
```


and back in 2020:

```
Upcoming Ruby Conferences:

  in 62d   Rubyfuza, Thu-Sat Feb/6-8 (3d) @ Cape Town, South Africa
  in 74d   ParisRB Conf, Tue+Wed Feb/18+19 (2d) @ Paris, France
  in 76d   RubyConf Australia, Thu+Fri Feb/20+21 (2d) @ Melbourne, Victoria, Australia
  in 105d  Wrocław <3 Ruby (wroclove.rb), Fri-Sun Mar/20-22 (3d) @ Wrocław, Poland
  in 118d  RubyDay Italy, Thu Apr/2 (1d) @ Verona, Veneto, Italy
  in 125d  RubyKaigi, Thu-Sat Apr/9-11 (3d) @ Nagano, Japan
  in 141d  RubyConf India, Sat+Sun Apr/25+26 (2d) @ Goa, India
  in 151d  RailsConf (United States), Tue-Thu May/5-7 (3d) @ Portland, Oregon, United States
  in 161d  Balkan Ruby, Fri+Sat May/15+16 (2d) @ Sofia, Bulgaria
  in 183d  Ruby Unconf Hamburg, Sat+Sun Jun/6+7 (2d) @ Hamburg, Germany
  in 210d  Brighton RubyConf, Fri Jul/3 (1d) @ Brighton, Sussex, England, United Kingdom
  in 230d  RubyConf Kenya, Thu-Sat Jul/23-25 (3d) @ Nairobi, Kenya
  in 259d  European Ruby Konference (EuRuKo), Fri+Sat Aug/21+22 (2d) @ Helsinki, Finnland
  in 347d  RubyConf (United States), Tue-Thu Nov/17-19 (3d) @ Houston, Texas, United States
```

and back in 2015

```
Upcoming Ruby Conferences:

  NOW ON 2d   RubyMotion Conference - #inspect, Wed+Thu Jul/1+2 (2d) @ Paris, France

  in 18d   Brighton Ruby Conference, Mon Jul/20 (1d) @ Brighton, East Sussex, England
  in 27d   European Ruby Camp - eurucamp, Fri-Sun Jul/31-Aug/2 (3d) @ Berlin (Potsdam), Germany
  in 27d   JRuby Conference Europe - JRubyConf EU, Fri Jul/31 (1d) @ Berlin (Potsdam), Germany
  in 28d   Burlington Ruby Conference, Sat+Sun Aug/1+2 (2d) @ Burlington, Vermont, New England, United States
  in 50d   Madison+ Ruby, Fri+Sat Aug/21+22 (2d) @ Madison, Wisconsin, Great Lakes,  United States
  in 71d   RubyConf Taiwan, Fri+Sat Sep/11+12 (2d) @ Taipei, Taiwan
  in 72d   RubyConf Portugal, Mon+Tue Sep/14+15 (2d) @ Braga, Portugal
  in 78d   RubyConf Brasil, Fri+Sat Sep/18+19 (2d) @ São Paulo, Brazil
  in 83d   Rocky Mountain RubyConf, Wed-Fri Sep/23-25 (3d) @ Boulder, Colorado, Rocky Mountains, United States
  in 85d   Ruby Open Source Software (ROSS) Conference - ROSSConf, Sat Sep/26 (1d) @ Berlin, Germany
  in 93d   ArrrCamp, Thu+Fri Oct/1+2 (2d) @ Ghent, Oost-Vlaanderen, Belgium
  in 105d  RubyConf Colombia, Thu+Fri Oct/15+16 (2d) @ Medellin, Colombia
  in 107d  European Ruby Konference - EuRuKo, Sat+Sun Oct/17+18 (2d) @ Salzburg, Austria
  in 132d  RubyWorld Conference, Wed+Thu Nov/11+12 (2d) @ Matsue, Japan
  ...
```



### Upcoming Python Conferences

Use

```
$ pycon
```

to list upcoming Python (un)conferences from around the world. Will print in 2020:

```
Upcoming Python Conferences:

  in 62d  PyCascades, Sat+Sun Feb/8+9 (2d) @ Portland, Oregon, United States
  in 72d  PyCon Namibia, Tue-Thu Feb/18-20 (3d) @ Windhoek, Namibia
  in 90d  PyTennessee, Sat+Sun Mar/7+8 (2d) @ Nashville, Tennessee, United States
  in 110d  Moscow Python Conf, Fri Mar/27 (1d) @ Moscow, Russia
  in 116d  PyCon Italy, Thu-Sun Apr/2-5 (4d) @ Florence, Italy
  in 129d  PyCon US, Wed-Thu Apr/15-23 (9d) @ Pittsburgh, Pennsylvania, United States
  in 160d  PyTexas, Sat+Sun May/16+17 (2d) @ Austin, Texas, United States
  in 225d  EuroPython, Mon-Sun Jul/20-26 (7d) @ Dublin, Ireland
  in 230d  PyOhio, Sat+Sun Jul/25+26 (2d) @ Columbus, Ohio, United States
  in 232d  EuroSciPy, Mon-Fri Jul/27-31 (5d) @ Bilbao, Spain
  in 232d  GeoPython, Mon-Fri Jul/27-31 (5d) @ Bilbao, Spain
  in 311d  PyConDE & PyData Berlin, Wed-Fri Oct/14-16 (3d) @ Berlin, Germany
```


### Upcoming Football Tournaments

Use

```
$ kickoff
```

to list upcoming football tournaments from around the world. Will print:

```
Upcoming Football Tournaments:

  NOW ON 18d    Women's World Cup 2015, Sat-Sun Jun/6-Jul/5 (30d) @ Canada › World (FIFA)
  NOW ON 13d    Copa América 2015, Thu-Sat Jun/11-Jul/4 (24d) @ Chile › South America (CONMEBOL)

  in 14d    Gold Cup / Copa de Oro 2015, Tue-Sun Jul/7-26 (20d) @ United States+Canada › North America (CONCACAF)
  in 346d   Copa América 2016, Fri-Sun Jun/3-26 (24d) @ United States › South America (CONMEBOL)
  in 353d   European Championship (Euro) 2016, Fri-Sun Jun/10-Jul/10 (31d) @ France › Europe (UEFA)
  in 1087d  World Cup 2018, Thu-Sun Jun/14-Jul/15 (32d) @ Russia › World (FIFA)
  ...
```


### Upcoming Beerfests

Use

```
$ beerfest
```

to list upcoming beer festivals from around the world. Will print:

```
Upcoming Beerfests:

  in 9d    Ottakringer Braukultur Wochen (9 Brauereien in 9 Wochen), Thu-Wed Jul/2-Sep/2 (63d) @ 16., Ottakring › Vienna / Wien › Austria / Österreich (at) › Central Europe › Europe
  in 31d   Annafest ("Auf den Kellern"), Fri-Mon Jul/24-Aug/3 (11d) @ Forchheim › Upper Franconia / Oberfranken › Bavaria / Bayern › Germany / Deutschland (de) › Central Europe › Europe
  in 32d   Kulmbacher Bierwoche, Sat-Sun Jul/25-Aug/2 (9d) @ Kulmbach › Upper Franconia / Oberfranken › Bavaria / Bayern › Germany / Deutschland (de) › Central Europe › Europe
  in 58d   Sandwerka (Sandkirchweih), Thu-Mon Aug/20-24 (5d) @ Bamberg › Upper Franconia / Oberfranken › Bavaria / Bayern › Germany / Deutschland (de) › Central Europe › Europe
  in 88d   Oktoberfest ("Die Wiesn"), Sat-Sun Sep/19-Oct/4 (16d) @ Munich / München › Upper Bavaria / Oberbayern › Bavaria / Bayern › Germany / Deutschland (de) › Central Europe › Europe
  in 123d  Biermesse Ried (Festival der Biervielfalt), Sat+Sun Oct/24+25 (2d) @ Ried i. Innkreis › Upper Austria / Oberösterreich › Austria / Österreich (at) › Central Europe › Europe
  ...
```



## Do-It-Yourself (DIY) - Use Your Own Event Datasets

Note: You can pass in local or remote datafiles in the markdown, yaml or csv formats
instead of using the built-in / pre-configured datafiles.
Example:

```
$ rubyconf https://github.com/planetruby/calendar/raw/master/_data/conferences2023.yml
# - or -
$ rubyconf conferences2023.yml  # note: assumes a saved (local) copy in the working dir (./)

$ pycon https://github.com/python-organizers/conferences/raw/master/2023.csv
# - or
$ pycon 2023.csv                # note: assumes a saved (local) copy in the working dir (./)

$ kickoff https://github.com/footballbook/calendar/raw/master/README.md
# - or -
$ kickoff README.md             # note: assumes a saved (local) copy in the working dir (./)
```



## `whatson` Command Line Tool

Use the `whatson` command line tool as a "generic catch-all" to print any type of event.
Example:

```
$ whatson https://github.com/planetruby/calendar/raw/master/_data/conferences2023.yml \
          https://github.com/python-organizers/conferences/raw/master/2023.csv
```

Note: `whatson` is pre-configured (that is, if you do not pass along any datafiles)
to print ongoing and upcoming ruby and python conferences.

For easy (re)use you can write all datafiles in a text file and pass along the
text file. Example - `conf.txt`:

```
########################################
#  conf.txt - What's On Datafiles

https://github.com/planetruby/calendar/raw/master/_data/conferences2023.yml
https://github.com/python-organizers/conferences/raw/master/2023.csv
```

And pass along to `whatson`. Example:

```
$ whatson conf.txt
```


Resulting back in 2020:

```
reading >conf.txt<...
  reading >https://github.com/planetruby/calendar/raw/master/_data/conferences2020.yml<...
  reading >https://github.com/python-organizers/conferences/raw/master/2020.csv<...


Upcoming Events:

 in 60d  Rubyfuza, Thu-Sat Feb/6-8 (3d) @ Cape Town, South Africa
 in 62d  PyCascades, Sat+Sun Feb/8+9 (2d) @ Portland, Oregon, United States
 in 72d  ParisRB Conf, Tue+Wed Feb/18+19 (2d) @ Paris, France
 in 72d  PyCon Namibia, Tue-Thu Feb/18-20 (3d) @ Windhoek, Namibia
 ...
```




## Public Event Datasets

- [Calendar @ Planet Ruby](https://github.com/planetruby/calendar) - a collection of awesome Ruby events (meetups, conferences, camps, etc.) from around the world
- [Calendar @ World Football Book](https://github.com/footballbook/calendar) - a collection of awesome football tournaments, cups, etc. from around the world
- [Calendar @ World Beer Book](https://github.com/beerbook/calendar) - a collection of awesome beer events (oktoberfest, starkbierfest, etc.) from around the world




## Install

Just install the gem:

    $ gem install whatson


## License

The `whatson` scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.


## Questions? Comments?

Send them along to the ruby-talk mailing list.
Thanks!
