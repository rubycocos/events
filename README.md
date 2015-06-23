# whatson

what's on now command line tool (using the event.db machinery)

* home  :: [github.com/textkit/whatson](https://github.com/textkit/whatson)
* bugs  :: [github.com/textkit/whatson/issues](https://github.com/textkit/whatson/issues)
* gem   :: [rubygems.org/gems/whatson](https://rubygems.org/gems/whatson)
* rdoc  :: [rubydoc.info/gems/whatson](http://rubydoc.info/gems/whatson)
* forum :: [ruby-talk@ruby-lang.org](http://www.ruby-lang.org/en/community/mailing-lists)


## Command-Line Tools

The whatson gem includes command-line tools
to list upcoming events (ruby conferences, football tournaments, beer festivals. etc.).


### Upcoming Ruby Conferences

Use

~~~
$ rubyconf
~~~

to list upcoming Ruby (un)conferences from around the world. Will print:

~~~
Upcoming Ruby Conferences:

  in 8d    RubyMotion Conference - #inspect, Wed+Thu Jul/1+2 (2d) @ Paris, France › Europe
  in 27d   Brighton Ruby Conference, Mon Jul/20 (1d) @ Brighton, East Sussex › England (en) › Western Europe › Europe
  in 38d   European Ruby Camp - eurucamp, Fri-Sun Jul/31-Aug/2 (3d) @ Berlin (Potsdam), Germany › Europe
  in 38d   JRuby Conference Europe - JRubyConf EU, Fri Jul/31 (1d) @ Berlin (Potdam), Germany › Europe
  in 39d   Burlington Ruby Conference, Sat+Sun Aug/1+2 (2d) @ Burlington, Vermont › New England › United States (us) › North America › America
  in 59d   Madison+ Ruby, Fri+Sat Aug/21+22 (2d) @ Madison, Wisconsin › Great Lakes › United States (us) › North America › America
  in 70d   Full Stack Fest - Barcelona Ruby Conference (BaRuCo) + Barcelona Future JS, Tue-Sat Sep/1-5 (5d) @ Barcelona, Catalonia › Spain / España (es) › Southern Europe › Europe
  in 80d   RubyConf Taiwan, Fri+Sat Sep/11+12 (2d) @ Taipei › Taiwan (tw) › Asia
  in 83d   RubyConf Portugal, Mon+Tue Sep/14+15 (2d) @ Braga › Portugal (pt) › Southern Europe › Europe
  in 87d   RubyConf Brasil, Fri+Sat Sep/18+19 (2d) @ São Paulo › Brazil / Brasil (br) › South America › America
  in 92d   Rocky Mountain Ruby Conference, Wed-Fri Sep/23-25 (3d) @ Boulder, Colorado › Rocky Mountains › United States (us) › North America › America
  in 95d   Ruby Open Source Software (ROSS) Conference - ROSSConf, Sat Sep/26 (1d) @ Berlin, Germany › Europe
  in 100d  ArrrCamp, Thu+Fri Oct/1+2 (2d) @ Ghent, Oost-Vlaanderen › Belgium / België / Belgique (be) › Western Europe › Europe
  in 114d  RubyConf Colombia, Thu+Fri Oct/15+16 (2d) @ Medellin › Colombia (co) › South America › America
  in 116d  European Ruby Konference - EuRuKo, Sat+Sun Oct/17+18 (2d) @ Salzburg, Austria › Europe
  in 141d  RubyWorld Conference, Wed+Thu Nov/11+12 (2d) @ Matsue › Japan (jp) › Asia
  ...
~~~


### Upcoming Football Tournaments

Use

~~~
$ kickoff
~~~

to list upcoming football tournaments from around the world. Will print:

~~~
Upcoming Football Tournaments:

  NOW ON 18d    Women's World Cup 2015, Sat-Sun Jun/6-Jul/5 (30d) @ Canada › World (FIFA)
  NOW ON 13d    Copa América 2015, Thu-Sat Jun/11-Jul/4 (24d) @ Chile › South America (CONMEBOL)

  in 14d    Gold Cup / Copa de Oro 2015, Tue-Sun Jul/7-26 (20d) @ United States+Canada › North America (CONCACAF)
  in 346d   Copa América 2016, Fri-Sun Jun/3-26 (24d) @ United States › South America (CONMEBOL)
  in 353d   European Championship (Euro) 2016, Fri-Sun Jun/10-Jul/10 (31d) @ France › Europe (UEFA)
  in 1087d  World Cup 2018, Thu-Sun Jun/14-Jul/15 (32d) @ Russia › World (FIFA)
  ...
~~~


### Upcoming Beerfests

Use

~~~
$ beerfest
~~~

to list upcoming beer festivals from around the world. Will print:

~~~
Upcoming Beerfests:

  in 9d    Ottakringer Braukultur Wochen (9 Brauereien in 9 Wochen), Thu-Wed Jul/2-Sep/2 (63d) @ 16., Ottakring › Vienna / Wien › Austria / Österreich (at) › Central Europe › Europe
  in 31d   Annafest ("Auf den Kellern"), Fri-Mon Jul/24-Aug/3 (11d) @ Forchheim › Upper Franconia / Oberfranken › Bavaria / Bayern › Germany / Deutschland (de) › Central Europe › Europe
  in 32d   Kulmbacher Bierwoche, Sat-Sun Jul/25-Aug/2 (9d) @ Kulmbach › Upper Franconia / Oberfranken › Bavaria / Bayern › Germany / Deutschland (de) › Central Europe › Europe
  in 58d   Sandwerka (Sandkirchweih), Thu-Mon Aug/20-24 (5d) @ Bamberg › Upper Franconia / Oberfranken › Bavaria / Bayern › Germany / Deutschland (de) › Central Europe › Europe
  in 88d   Oktoberfest ("Die Wiesn"), Sat-Sun Sep/19-Oct/4 (16d) @ Munich / München › Upper Bavaria / Oberbayern › Bavaria / Bayern › Germany / Deutschland (de) › Central Europe › Europe
  in 123d  Biermesse Ried (Festival der Biervielfalt), Sat+Sun Oct/24+25 (2d) @ Ried i. Innkreis › Upper Austria / Oberösterreich › Austria / Österreich (at) › Central Europe › Europe
  ...
~~~


## Public Event Datasets

- [awesome-events @ Planet Ruby](https://github.com/planetruby/awesome-events) - a collection of awesome Ruby events (meetups, conferences, camps, etc.) from around the world
- [calendar @ football.db](https://github.com/openfootball/calendar) - a collection of awesome football tournaments, cups, etc. from around the world
- [calendar @ beer.db](https://github.com/openbeer/calendar) - a collection of awesome beer events (oktoberfest, starkbierfest, etc.) from around the world


## Install

Just install the gem:

    $ gem install whatson


## License

The `whatson` scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.


## Questions? Comments?

Send them along to the ruby-talk mailing list.
Thanks!
