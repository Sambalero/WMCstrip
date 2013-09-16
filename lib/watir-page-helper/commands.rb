require 'watir-page-helper'
require 'watir-webdriver'
require 'forwardable'

require 'watir-page-helper/pages/home_page'
require 'watir-page-helper/pages/results_page'

module WatirPageHelper
  class Page
    include WatirPageHelper
    extend Forwardable
    attr_reader :browser

    def_delegators :@browser, :title, :url, :html, :status, :refresh, :back

    def initialize browser
      @browser = browser
    end
  end

  class << self
    attr_accessor :browser

    def create
      @browser = ::Watir::Browser.new ENV['WEBDRIVER'] || :firefox
    end

    def close
      @browser.close
    end
  end

  module Commands
    extend WatirPageHelper::Google::HomePage
    extend WatirPageHelper::Google::ResultsPage

    def classify s
      s.to_s.split('_').map(&:capitalize).join
    end

    def page_class *args
      return args.first.new WatirPageHelper.browser if args.first.is_a? Class
#if the t first argument is a class return a new object of that cclass as the browser attributer of the WatirPageHelper
#(otherwise)
      page = WatirPageHelper::Page.new WatirPageHelper.browser
#page is a new (WPH)page object; a WPHbrowser is passed in as its browser attribute

      mod = WatirPageHelper
      args.each do |name| #name is google, home_page
        #classify name is Google, HomePage
        mod = mod.const_get classify name
#mod constget: find the constant(classname) with the value in mod
#mod = Google, HomePage (classnames)
      end
# puts "*****mod******   #{mod}" ->WatirPageHelper::Google::HomePage
      page.extend mod
      #extend the page with WPH.HomePage
      page
    end

    def on *args
      page_class(*args).tap do |p|
        p.expected_element if p.respond_to? :expected_element
        p.has_expected_title? if p.respond_to? :has_expected_title?
        yield p if block_given?
      end
    end

    def visit *args
#first call, args is (google, :home_page)
# puts"*************************"
# puts *args.inspect ->["google", :home_page]


      page_class(*args).tap do |p|
# puts "------00000----"
#puts p.inspect     #<WatirPageHelper::Page:0x007fbe643f50a0 @browser=#<Watir::Browser:0x..fa5f93a3efb99078 url="about:blank" title="">>
        p.goto
        p.expected_element if p.respond_to? :expected_element
        p.has_expected_title? if p.respond_to? :has_expected_title?
        yield p if block_given?
      end
    end
  end
end