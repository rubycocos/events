# event.db

event.db schema 'n' models for easy (re)use

* home  :: [github.com/rubycocos/events](https://github.com/rubycocos/events)
* bugs  :: [github.com/rubycocos/events/issues](https://github.com/rubycocos/events/issues)
* gem   :: [rubygems.org/gems/eventdb](https://rubygems.org/gems/eventdb)
* rdoc  :: [rubydoc.info/gems/eventdb](http://rubydoc.info/gems/eventdb)



---

NOTE: Command Line Tools - `rubyconf`, `kickoff`, `beerfest` - Now in `whatson` Package

The "out-of-the-box" ready-to-use command line tools (that is, `rubyconf`, `kickoff`, `beerfest`, etc.)
for listing upcoming events (ruby conferences, football tournaments, beer festivals, etc.)
moved to its own package / library, that is, `whatson`.
See the [whatson project for more »](../whatson)

---



## Usage

``` ruby
require 'eventdb'

## Step 1 - Setup (In-Memory) Database and Read-in / Fetch Events

url = "https://github.com/planetruby/calendar/raw/master/_data/conferences2023.yml"

db = EventDb::Memory.new    # note: use in-memory SQLite database
db.read( url )


## Step 2 - Print Out Ongoing and Upcoming Events

today = Date.today

puts 'Upcoming Ruby Conferences:'
puts ''

on = EventDb::Model::Event.live( today )
on.each do |e|
  puts "  NOW ON #{cur_day(today)}d   #{e.title}, #{e.date_fmt} (#{e.days}d) @ #{e.place}"
end

puts '' if on.any?

up = EventDb::Model::Event.limit( 17 ).upcoming( today )
up.each do |e|
  puts "  in #{diff_days(today)}d  #{e.title}, #{e.date_fmt} (#{e.days}d) @ #{e.place}"
end
```

will print in 2023:

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



## Format

**Markdown**

Option 1a) Classic Style

``` markdown
- [European Ruby Konference - EuRuKo](http://euruko.org)
    - 2020 @ Helsinki, Finnland; Aug/21+22
```

Option 1b) Modern Style

``` markdown
- **European Ruby Konference - EuRuKo** (web: [euruko.org](http://euruko.org))
    - 2020 @ Helsinki, Finnland; Aug/21+22
```

**YAML**

Option 2a) Style A

``` yaml
- title:       European Ruby Konference - EuRuKo
  link:        http://euruko.org
  place:       Helsinki, Finnland
  start_date:  2020-08-21
  end_date:    2020-08-22
```

Option 2b) Style B

``` yaml
- name:       European Ruby Konference - EuRuKo
  url:        http://euruko.org
  location:   Helsinki, Finnland
  start:      2020-08-21
  end:        2020-08-22
```

**CSV**

Option 3a) Style A

``` csv
title, link, place, start_date, end_date
European Ruby Konference - EuRuKo, http://euruko.org, "Helsinki, Finnland", 2020-08-21, 2020-08-22
```

Option 3b) Style B

``` csv
name, url, location, start, end
European Ruby Konference - EuRuKo, http://euruko.org, "Helsinki, Finnland", 2020-08-21, 2020-08-22
```

Option 3c) Style C

``` csv
subject, website_url, location, start_date, end_date
European Ruby Konference - EuRuKo, http://euruko.org, "Helsinki, Finnland", 2020-08-21, 2020-08-22
```


resulting in:

```
#<Event
    title:      "European Ruby Konference - EuRuKo",
    link:       "http://euruko.org",
    place:      "Helsinki, Finnland",
    start_date: Fri, 21 Aug 2020,
    end_date:   Sat, 22 Aug 2020>
```

Note: The headings hierarchy (starting w/ heading level 2) gets added to the place as a
geo tree. Example:

``` markdown
## Europe

### Central Europe

#### Germany

##### Bavaria

###### Upper Franconia

- [**Sandwerka (Sandkirchweih)**](http://www.sandkerwa.de)
   - 2020 @ Bamberg, Aug/20-24
```

resulting in:

```
#<Event
    title: "Sandwerka (Sandkirchweih)",
    link:  "http://www.sandkerwa.de",
    place: "Bamberg, Upper Franconia, Bavaria, Germany, Central Europe, Europe",
    ...>
```



## Public Event Datasets

- [Calendar @ Planet Ruby](https://github.com/planetruby/calendar) - a collection of awesome Ruby events (meetups, conferences, camps, etc.) from around the world
- [Calendar @ World Football Book](https://github.com/footballbook/calendar) - a collection of awesome football tournaments, cups, etc. from around the world
- [Calendar @ World Beer Book](https://github.com/beerbook/calendar) - a collection of awesome beer events (oktoberfest, starkbierfest, etc.) from around the world



## Install

Just install the gem:

    $ gem install eventdb


## License

The `eventdb` scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.


## Questions? Comments?

Send them along to the ruby-talk mailing list.
Thanks!
