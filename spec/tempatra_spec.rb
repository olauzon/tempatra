require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Tempatra" do

  before(:each) do
    remove_tmp_project
  end

  def remove_tmp_project
    `rm -rf #{TEMPATRA_ROOT}/spec/tmp`
  end

  it "generates a new sinatra project" do
    `ruby #{TEMPATRA_ROOT}/bin/tempatra spec/tmp`
  end

end
