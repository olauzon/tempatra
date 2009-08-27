Tempatra
========

A RubiGen Sinatra application generator providing Blueprint CSS, jQuery, Haml, Sass, Compass, RSpec, Cucumber, and Webrat.

Installation
------------

    $ sudo gem install olauzon-tempatra -s http://gems.github.com/

Basic Usage
-----------

To generate a new application:

    $ tempatra your-app-name

Move into your new application:

    $ cd your-app-name

Run your application:

    $ thin start -p 4567 -R config.ru

Then go to [http://localhost:4567/](http://localhost:4567/) with your browser.

While you develop, continuously compile your Sass stylesheets with Compass (in another terminal):

    $ compass --watch

And of course, use autospec (in yet another terminal)

    $ autospec


Options
-------

Show all options

    $ tempatra

Display Tempatra version number

    $ tempatra -v

Create git repository

    $ tempatra your-app-name -G

Create and push to Heroku

    $ tempatra your-app-name -H


Inspiration
-----------

Aaron Quint's [sinatra-gen](http://github.com/quirkey/sinatra-gen) is a Sinatra application generator that provides many options.


Copyright
---------

Copyright (c) 2009 Olivier Lauzon. See LICENSE for details.
