Then /^I can see list of (\d) posted blogs$/ do |count|
 page.should have_text("Title")
  end