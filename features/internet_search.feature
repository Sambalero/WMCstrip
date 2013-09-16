Feature: Internet Search
  As a casual internet user
  I want to find some information about watir, and do a quick conversion
  So that I can be knowledgeable being

  Scenario: Search for Watir
    Given I am on the Google Home Page
    When I search for "Watir"
    Then I should see at least 100,000 results
#    Scenarios:

#http://taooftest.wordpress.com/2012/05/11/cucumber-101/ talks about multiple scenarios using placeholders and 


  