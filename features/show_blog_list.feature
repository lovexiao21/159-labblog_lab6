Feature: Show blog list 
  As a blog visitor 
  I can see list of posted blogs 

Scenario: Show blog list 
  Given I am on the blog homepage
  And there are already 2 posts 
  Then I can see list of 2 posted blogs