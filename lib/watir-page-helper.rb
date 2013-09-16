require 'watir-page-helper/generated.rb'

# A helper mixin to make accessing web elements via Watir-WebDriver easier.
## This module assumes there is a @browser variable available.
module WatirPageHelper

  # A method that is called when this Module is included into a class
  # @param [Class] cls The class that this module is being included in the literal expected title for the page
  # @return [Nil]
  def self.included(cls)
    cls.extend ClassMethods
  end

  # A collection of class methods that generate helper methods that are mixed into a calling class.
  module ClassMethods

    # Creates a method that compares the expected_title of a page against the actual.
    # @param [String] expected_title the literal expected title for the page
    # @param [Regexp] expected_title the expected title pattern for the page
    # @return [Nil]
    # @raise An exception if expected_title does not match actual title
    #
    # @example Specify 'Google' as the expected title of a page
    #   expected_title "Google"
    #   page.has_expected_title?
    def expected_title expected_title
      define_method("has_expected_title?") do
        has_expected_title = expected_title.kind_of?(Regexp) ? expected_title =~ @browser.title : expected_title == @browser.title
        raise "Expected title '#{expected_title}' instead of '#{@browser.title}'" unless has_expected_title
      end
    end
    
    # Creates a method that provides a way to initialize a page based upon an expected element.
    # This is useful for pages that load dynamic content.
    # @param [Symbol] type the type of element you are expecting
    # @param [Hash] identifier the name, value pair used to identify the object
    # @param [optional, Integer] timeout default value is 30 seconds
    # @return [Nil]
    #
    # @example Specify a text box as expected on the page within 10 seconds
    #   expected_element(:text_field, :name => "firstname", 10)
    #   page.expected_element
    def expected_element type, identifier, timeout=30
      define_method("expected_element") do
        @browser.send("#{type.to_s}", identifier).wait_until_present timeout
      end
    end

    # Provides a way to define a direct URL for a page, and creates a method for the page to go to that URL.
    # @param [String] url the URL to directly access the page
    # @return [Nil]
    #
    # @example Set the direct URL for the Google Home Page
    #   direct_url "http://www.google.com"
    #   page.goto # navigates to the Google URL
    def direct_url url
      define_method("goto") do
        @browser.goto url
      end
    end

    # Generates four select_list methods to:
    # * get the value specified in a select_list
    # * select a value in a select list;
    # * see whether a value is selected; and
    # * return the select_list element.
    #
    # @param [Symbol] name The name of the select_list element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a select list to generate methods
    #   select_list :cars, :name => "cars"
    #   page.cars = "Mazda" #select
    #   page.cars.should == "Mazda" #check
    #   page.cars_selected?("Mazda").should be_true #selected?
    #   page.cars_select_list.exists?.should be_true #object
    def select_list name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_select_list").value
      end
      define_method("#{name}=") do |value|
        self.send("#{name}_select_list").select(value)
      end
      define_method("#{name}_selected?") do |value|
        self.send("#{name}_select_list").selected?(value)
      end
      create_element_getter "#{name}_select_list", identifier, __method__, block
    end

    # Generates four checkbox methods to:
    # * check the checkbox;
    # * uncheck the checkbox;
    # * see whether a the checkbox is checked; and
    # * return the checkbox element.
    #
    # @param [Symbol] name The name of the checkbox element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a checkbox to generate methods
    #   checkbox :agree, :name => "agree"
    #   page.check_agree
    #   page.agree?.should be_true
    #   page.uncheck_agree
    #   page.agree?.should be_false
    #   page.agree_checkbox.exist?.should be_true
    def checkbox name, identifier=nil, &block
      define_method("check_#{name}") do
        self.send("#{name}_checkbox").set
      end
      define_method("uncheck_#{name}") do
        self.send("#{name}_checkbox").clear
      end
      define_method("#{name}?") do
        self.send("#{name}_checkbox").set?
      end
      create_element_getter "#{name}_checkbox", identifier, __method__, block
    end

    # Generates three radio methods to:
    # * select a radio;
    # * see whether a radio is selected; and
    # * return the radio element.
    #
    # @param [Symbol] name The name of the radio element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a radio button to generate methods
    #   radio :medium, :value => "Medium"
    #   page.select_medium
    #   page.medium_set?.should be_true
    #   page.medium_radio.exist?.should be_true
    def radio name, identifier=nil, &block
      define_method("select_#{name}") do
        self.send("#{name}_radio").set
      end
      define_method("#{name}_set?") do
        self.send("#{name}_radio").set?
      end
      create_element_getter "#{name}_radio", identifier, __method__, block
      create_element_getter "#{name}_radio_button", identifier, __method__, block
    end

    def radio_button name, identifier=nil, &block
      warn 'radio_button is a deprecated method in the watir-page-helper gem, and will be removed in future versions.'
      radio name, identifier, &block
    end

    # Generates two row methods to:
    # * return the text from a table row;
    # * return the row element.
    #
    # @param [Symbol] name The name of the row element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a row to generate methods
    #  row(:test_table_row_1) { | test_table |  test_table.tr }
    #  page.test_table_row_1.should == "Test Table Col 1 Test Table Col 2"
    #  page.test_table_row_1_row.cells.length.should == 2
    def row name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_row").text
      end
      create_element_getter "#{name}_row", identifier, 'tr', block
    end

    # Generates two row methods to:
    # * return the text from a table cell;
    # * return the cell element.
    #
    # @param [Symbol] name The name of the cell element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a cell to generate methods
    #  cell(:test_table_row_1_cell_1) { |test_table_row_1 | test_table_row_1.td }
    #  page.test_table_row_1_cell_1.should == "Test Table Col 1"
    #  page.test_table_row_1_cell_1_cell.exist?.should be_true
    def cell name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_cell").text
      end
      create_element_getter "#{name}_cell", identifier, 'td', block
    end
    
    
    # Generates two file_field methods to:
    # * return the text from a file field;
    # * set a file field
    #
    # @param [Symbol] name The name of the file field element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a file_field to generate methods
    # file_field :upload, :id => 'upload'
    #  page.upload = image_path #set
    #  page.upload.should == image_path #check
    def file_field name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_file_field").value
      end
      define_method("#{name}=") do |value|
        self.send("#{name}_file_field").set value
      end
      create_element_getter "#{name}_file_field", identifier, __method__, block
    end
    
    private

    def create_element_getter name, identifier, type, block
      define_method name do
        if block
           block.arity == 1 ? block.call(self) : self.instance_eval(&block)
        else
          identifier.nil? ? @browser.send(type) : @browser.send(type, identifier)
        end
      end
    end

  end
end