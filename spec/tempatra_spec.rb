require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Tempatra" do

  it "generates a new sinatra project" do
    system "ruby #{TEMPATRA_ROOT}/bin/tempatra -N spec/tmp"
  end

end
