require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

# Commonly used webrat steps
# http://github.com/brynary/webrat

Given /^I am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I press "([^\"]*)"$/ do |button|
  click_button(button)
end

When /^I follow "([^\"]*)"$/ do |link|
  click_link(link)
end

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value) 
end

When /^I select "([^\"]*)" from "([^\"]*)"$/ do |value, field|
  select(value, :from => field) 
end

When /^I check "([^\"]*)"$/ do |field|
  check(field) 
end

When /^I uncheck "([^\"]*)"$/ do |field|
  uncheck(field) 
end

When /^I choose "([^\"]*)"$/ do |field|
  choose(field)
end

When /^I attach the file at "([^\"]*)" to "([^\"]*)"$/ do |path, field|
  attach_file(field, path)
end

Then /^I should see "([^\"]*)"$/ do |text|
  body.should contain(text)
end

Then /^I should not see "([^\"]*)"$/ do |text|
  body.should_not contain(text)
end

Then /^the "([^\"]*)" field should contain "([^\"]*)"$/ do |field, value|
  field_labeled(field).value.should =~ /#{value}/
end

Then /^the "([^\"]*)" field should not contain "([^\"]*)"$/ do |field, value|
  field_labeled(field).value.should_not =~ /#{value}/
end
    
Then /^the "([^\"]*)" checkbox should be checked$/ do |label|
  field_labeled(label).should be_checked
end

Then /^I should be on (.+)$/ do |page_name|
  URI.parse(current_url).path.should == path_to(page_name)
end

When /^I view the page$/ do
  save_and_open_page
end

def response
  last_response
end

def body
  response.body
end
