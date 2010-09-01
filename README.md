Tempatra
========

A RubiGen Sinatra application template generator providing Blueprint CSS, jQuery, Haml, Sass, Compass, RSpec, Cucumber, and Capybara.

Installation
------------

    $ gem sources -a http://gemcutter.org/ # If you do not have gemcutter as a source, add it!
    $ sudo gem install tempatra

Basic Usage
-----------

Generate a new application

    $ tempatra your-app-name

Move into your new application

    $ cd your-app-name

To run your application locally

    $ shotgun --server=thin -p 4567 config.ru

Then go to [http://localhost:4567/](http://localhost:4567/) with your browser)

To compile your Sass stylesheets with Compass on demand

    $ compass compile

To monitor your project for changes and automatically recompile

    $ compass watch

Use autospec

    $ autospec

Run RSpec and Cucumber tests

    $ rake


Options
-------

Show all options

    $ tempatra

Display Tempatra version number

    $ tempatra -v

Don't create git repository

    $ tempatra your-app-name -N

Don't run Compass as a standalone project

    $ tempatra your-app-name -C

Create and push to Heroku (requires heroku gem and Heroku account)

    $ tempatra your-app-name -H


Inspiration
-----------

Aaron Quint's [sinatra-gen](http://github.com/quirkey/sinatra-gen) is a Sinatra application generator that provides many options.


Authors
-------

Stewart Laufer (theIV)  
Olivier Lauzon (olauzon)


Copyright
---------

Copyright (c) 2009-2010 Olivier Lauzon. See LICENSE for details.
