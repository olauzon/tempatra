$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'tempatra'
require 'spec'
require 'spec/autorun'

TEMPATRA_ROOT = File.expand_path(File.dirname(__FILE__) + '/..')

Spec::Runner.configure do |config|
  
end
