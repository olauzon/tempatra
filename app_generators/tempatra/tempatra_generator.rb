require 'rbconfig'

class RubiGen::Commands::Create

  def run(command, relative_path = '')
    in_directory = destination_path(relative_path)
    logger.run command
    system("cd #{in_directory} && #{command}")
  end

end

class TempatraGenerator < RubiGen::Base
  attr_reader :app_name,
              :app_file_name,
              :app_full_name,
              :module_name,
              :git_init,
              :heroku,
              :compile

  def initialize(runtime_args, runtime_options = {})
    super
    usage if args.empty?
    @destination_root = args.shift
    @app_name         = File.basename(File.expand_path(@destination_root))
    @app_file_name    = app_name.gsub('-', '_')
    @app_full_name    = app_file_name.split('_').map{|w| w.capitalize }.join(' ')
    @module_name      = app_file_name.camelize
    extract_options
  end

  def manifest
    record do |m|
      # Root directory and all subdirectories.
      m.directory ''
      BASEDIRS.each { |path| m.directory path }

      # Root
      m.template  "_gems"         , ".gems"
      m.template  "_gitignore"    , ".gitignore"
      m.template  "config.rb.erb" , "config.rb"
      m.template  "config.ru.erb" , "config.ru"
      m.template  "config.yml.erb", "config.yml"
      m.template  "Rakefile.erb"  , "Rakefile"
      m.template  "README.md.erb" , "README.md"

      # Sinatra
      m.template  "lib/tempatra.rb.erb" , "lib/#{app_file_name}.rb"

      # Haml
      m.template  "views/layout.haml.erb" , "views/layout.haml"
      m.template  "views/index.haml.erb"  , "views/index.haml"

      # jQuery
      m.template  "public/javascripts/jquery-1.3.2.min.js",
                  "public/javascripts/jquery-1.3.2.min.js"

      m.template  "public/javascripts/application.js.erb",
                  "public/javascripts/application.js"

      # Cucumber
      m.template  "features/homepage.feature.erb",
                  "features/homepage.feature"

      m.template  "features/step_definitions/webrat_steps.rb",
                  "features/step_definitions/webrat_steps.rb"

      m.template  "features/support/env.rb.erb",
                  "features/support/env.rb"

      m.template  "features/support/paths.rb",
                  "features/support/paths.rb"

      # RSpec
      m.template  "spec/rcov.opts",
                  "spec/rcov.opts"

      m.template  "spec/spec.opts",
                  "spec/spec.opts"

      m.template  "spec/spec_helper.rb.erb",
                  "spec/spec_helper.rb"

      m.template  "spec/tempatra_spec.rb.erb",
                  "spec/#{app_file_name}_spec.rb"

      # Sass
      m.template  "views/stylesheets/ie.sass",
                  "views/stylesheets/ie.sass"

      m.template  "views/stylesheets/main.sass.erb",
                  "views/stylesheets/main.sass"

      m.template  "views/stylesheets/print.sass",
                  "views/stylesheets/print.sass"

      m.template  "views/stylesheets/partials/_base.sass.erb",
                  "views/stylesheets/partials/_base.sass"

      # Compass
      compass = which "compass"
      unless File.exist?(File.expand_path(@destination_root) + '/public/images/grid.png')
        m.run("#{compass} --force --grid-img --images-dir public/images")
      end
      m.run("#{compass}") if compile

      # Git
      if heroku || git_init
        git = which "git"
        unless File.exist?(File.expand_path(@destination_root) + '/.git/config')
          m.run("#{git} init")
        end
      end

      # Heroku
      if heroku
        heroku = which "heroku"
        m.run("#{heroku} create")
        m.run("#{git} add .")
        m.run("#{git} commit -m 'Initial commit'")
        m.run("#{git} push heroku master")
        m.run("#{heroku} open")
      end

      # Display introductory message
      m.puts "
    ----------------------
    #{app_full_name}

    Move into your new application
    $ cd #{app_name}

    To run your application
    $ shotgun --server=thin -p 4567 config.ru
    (Then go to http://localhost:4567/ with your browser)

    You can continuously compile your Sass stylesheets with Compass
    $ compass --watch

    And of course, use autospec
    $ autospec


"
    end

  end

protected

  def banner
    <<-EOS
    ----------------------
    Tempatra

    A Sinatra application generator using Blueprint CSS, jQuery, Haml, Sass, Compass, RSpec, Cucumber, and Webrat.

    Usage: tempatra your-app-name [options]
    EOS
  end

  def add_options!(opts)
    opts.separator ''
    opts.separator "Tempatra options:"
    opts.on("-v", "--version" , "Show the Tempatra version number and quit")
    opts.on("-C", "--compile" , "Compile Compass stylesheets")    {|o| options[:compile]  = o}
    opts.on("-N", "--no-git"  , "Don't create a git repository")  {|o| options[:no_git]   = o}
    opts.on("-H", "--heroku"  , "Create and push to Heroku")      {|o| options[:heroku]   = o}
  end

  BASEDIRS = %w(
                  features
                  features/step_definitions
                  features/support
                  lib
                  public
                  public/javascripts
                  spec
                  views
                  views/stylesheets
                  views/stylesheets/partials
              )

  def extract_options
    @compile  = options[:compile].nil? ? false  : true
    @git_init = options[:no_git].nil?  ? true   : false
    @heroku   = options[:heroku].nil?  ? false  : true
  end

  def which(bin)
    `which #{bin}`.strip
  end

end
