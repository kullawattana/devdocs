module Docs
  class Erlang < FileScraper
    self.type = 'erlang'
    self.root_path = 'doc/index.html'
    self.links = {
      home: 'https://www.erlang.org/',
      code: 'https://github.com/erlang/otp'
    }

    html_filters.insert_after 'container', 'erlang/pre_clean_html'
    html_filters.push 'erlang/entries', 'erlang/clean_html'

    options[:only_patterns] = [/\Alib/]

    options[:skip_patterns] = [
      /pdf/,
      /release_notes/,
      /result/,
      /java/,
      /\/html\/.*_app\.html\z/,
      /_examples\.html\z/,
      /\Alib\/edoc/,
      /\Alib\/erl_docgen/,
      /\Alib\/hipe/,
      /\Alib\/ose/,
      /\Alib\/test_server/,
      /\Alib\/jinterface/,
      /\Alib\/wx/,
      /\Alib\/ic/,
      /\Alib\/Cos/i
    ]

    options[:attribution] = <<-HTML
      &copy; 1999&ndash;2016 Ericsson AB<br>
      Licensed under the Apache License, Version 2.0.
    HTML

    version '18' do
      self.release = '18.3'
      self.dir = '/Users/Thibaut/DevDocs/Docs/Erlang18'
    end
  end
end
