And /^there is a post with title "Dummy Post" and content "Dummy Content"/ do |title , content|
	 Post.create!({ :title => "Dummy Post", :content => "Dummy Content"})
end

When /^I edit this post/ do
	click_on "Edit"
	fill_in "Title", :with => title_update
	fill_in "Content", :with => content 
	click_button "Update Post"
end

And /^I update title to "Updated title" and content to "Updated content" / do |title_update , content_update|
	@title = title_update
	fill_in "Title", :with => title_update
	fill_in "Content", :with => content 
	click_button "Update Post"
end
	
Then /^I can see it has been updated/ do
	page.should have_text("Updated title")
end