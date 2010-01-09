Tempatra
========

A RubiGen Sinatra application generator providing Blueprint CSS, jQuery, Haml, Sass, Compass, RSpec, Cucumber, and Webrat.

Installation
------------

    $ gem sources -a http://gemcutter.org/ # If you do not have gemcutter as a source, add it!
    $ sudo gem install tempatra

Basic Usage
-----------

To generate a new application:

    $ tempatra your-app-name

Move into your new application:

    $ cd your-app-name

Run your application:

    $ shotgun --server=thin -p 4567 config.ru

Then go to [http://localhost:4567/](http://localhost:4567/) with your browser.

You can continuously compile your Sass stylesheets with Compass (in another terminal):

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

Copyright (c) 2009 Olivier Lauzon. See LICENSE for details.
