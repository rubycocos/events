require 'hoe'
require './lib/whatson/version.rb'

Hoe.spec 'whatson' do

  self.version = WhatsOn::VERSION

  self.summary = "whatson - what's on now command line tool (using the event.db machinery)"
  self.description = summary

  self.urls    = ['https://github.com/textkit/whatson']

  self.author  = 'Gerald Bauer'
  self.email   = 'ruby-talk@ruby-lang.org'

  # switch extension to .markdown for gihub formatting
  self.readme_file  = 'README.md'
  self.history_file = 'CHANGELOG.md'

  self.extra_deps = [
    ['eventdb', '>= 1.1.0'],
    ## 3rd party
    ['fetcher', '>= 0.4.5'],
    ['sqlite3']
  ]

  self.licenses = ['Public Domain']

  self.spec_extras = {
    required_ruby_version: '>= 2.2.2'
  }
end
