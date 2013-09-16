require 'watir-page-helper'

module WatirPageHelper::Google #creates or amends found in watir-page_helper/(???pages???)/google
  module HomePage #home_page.rb
    extend WatirPageHelper::ClassMethods
#to be included as if part of the watir_page_helper.rb::ClassMethods module "
 # A collection of class methods that generate helper methods that are mixed into a calling class." which this doesn't seem to do.
    
    # no country redirect link, since travis-ci ends up getting sent to the german site
    direct_url "http://www.google.com/ncr"
    expected_title "Google"

    text_field :search, :name => "q"

    def search_for term
      self.search = term
      self.search_text_field.respond_to?(:send_keys) ? self.search_text_field.send_keys(:enter) : @browser.send_keys('{ENTER}')
    end
  end
end
