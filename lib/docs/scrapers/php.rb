module Docs
  class Php < FileScraper
    include FixInternalUrlsBehavior

    self.name = 'PHP'
    self.type = 'php'
    self.release = 'up to 7.0.7'
    self.base_url = 'https://secure.php.net/manual/en/'
    self.root_path = 'index.html'
    self.initial_paths = %w(
      funcref.html
      langref.html
      refs.database.html
      set.mysqlinfo.html
      language.control-structures.html
      reference.pcre.pattern.syntax.html
      reserved.exceptions.html
      reserved.interfaces.html
      reserved.variables.html)

    self.links = {
      home: 'https://secure.php.net/',
      code: 'https://github.com/php/php-src'
    }

    # Downloaded from php.net/download-docs.php
    self.dir = '/Users/Thibaut/DevDocs/Docs/PHP'

    html_filters.push 'php/internal_urls', 'php/entries', 'php/clean_html', 'title'
    text_filters.push 'php/fix_urls'

    options[:title] = false
    options[:root_title] = 'PHP: Hypertext Preprocessor'
    options[:skip_links] = ->(filter) { !filter.initial_page? }

    options[:only_patterns] = [
      /\Alanguage\./,
      /\Aclass\./,
      /\Afunctions?\./,
      /\Acontrol-structures/,
      /\Aregexp\./,
      /\Areserved\.exceptions/,
      /\Areserved\.interfaces/,
      /\Areserved\.variables/]

    BOOKS = %w(apache apc array bc bzip2 calendar csprng classobj ctype curl
      datetime dba dir dom eio errorfunc event exec fileinfo filesystem filter
      ftp funchand gearman geoip gettext gmagick gmp hash iconv iisfunc image
      imagick imap info inotify intl json ldap libevent libxml mail mailparse
      math mbstring mcrypt memcached misc mysqli network oauth openssl
      outcontrol password pcre pdo pgsql posix pthreads regex runkit reflection
      sca session session-pgsql simplexml soap sockets solr sphinx spl
      spl-types sqlite3 sqlsrv ssh2 stats stream strings taint tidy uodbc url
      var varnish xml xmlreader xmlrpc xmlwriter xsl yaf yar yaml zip zlib)

    options[:only] = BOOKS.map { |s| "book.#{s}.html" }

    options[:skip] = %w(
      control-structures.intro.html
      control-structures.alternative-syntax.html
      function.mssql-select-db.html
      pthreads.modifiers.html)

    options[:skip_patterns] = [/mysqlnd/]

    options[:attribution] = <<-HTML
      &copy; 1997&ndash;2016 The PHP Documentation Group<br>
      Licensed under the Creative Commons Attribution License v3.0 or later.
    HTML
  end
end
