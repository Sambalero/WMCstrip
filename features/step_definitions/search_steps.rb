Given /^I am on the Google Home Page$/ do  
#use stuff in parens as source for params
  @site = "google"
#downcase it, assign as instance variable
  visit @site, :home_page
#visit is
end

When /^I search for "Watir"$/ do  
  on @site, :home_page do |page|
    page.search_for "Watir"
  end
end


Then /^I should see at least ([\d,]+) results$/ do |exp_num_results|
  on @site, :results_page do |page|
    assert page.number_search_results >= exp_num_results.gsub(",","").to_i

  end
end

