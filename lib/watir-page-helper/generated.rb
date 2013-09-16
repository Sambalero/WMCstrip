module WatirPageHelper
  module ClassMethods

    # Generates two h1 methods to:
    # * return the text from a h1;
    # * return the h1 element.
    #
    # @param [Symbol] name The name of the h1 element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a h1 to generate methods
    # h1 :my_element, :id => "my_element"
    # page.my_element.should == "My Element Text"
    # page.my_element_h1.exist?.should be_true
    def h1 name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_h1").text
      end
      create_element_getter "#{name}_h1", identifier, __method__, block
    end

    # Generates two h2 methods to:
    # * return the text from a h2;
    # * return the h2 element.
    #
    # @param [Symbol] name The name of the h2 element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a h2 to generate methods
    # h2 :my_element, :id => "my_element"
    # page.my_element.should == "My Element Text"
    # page.my_element_h2.exist?.should be_true
    def h2 name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_h2").text
      end
      create_element_getter "#{name}_h2", identifier, __method__, block
    end

    # Generates two h3 methods to:
    # * return the text from a h3;
    # * return the h3 element.
    #
    # @param [Symbol] name The name of the h3 element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a h3 to generate methods
    # h3 :my_element, :id => "my_element"
    # page.my_element.should == "My Element Text"
    # page.my_element_h3.exist?.should be_true
    def h3 name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_h3").text
      end
      create_element_getter "#{name}_h3", identifier, __method__, block
    end

    # Generates two h4 methods to:
    # * return the text from a h4;
    # * return the h4 element.
    #
    # @param [Symbol] name The name of the h4 element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a h4 to generate methods
    # h4 :my_element, :id => "my_element"
    # page.my_element.should == "My Element Text"
    # page.my_element_h4.exist?.should be_true
    def h4 name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_h4").text
      end
      create_element_getter "#{name}_h4", identifier, __method__, block
    end

    # Generates two h5 methods to:
    # * return the text from a h5;
    # * return the h5 element.
    #
    # @param [Symbol] name The name of the h5 element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a h5 to generate methods
    # h5 :my_element, :id => "my_element"
    # page.my_element.should == "My Element Text"
    # page.my_element_h5.exist?.should be_true
    def h5 name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_h5").text
      end
      create_element_getter "#{name}_h5", identifier, __method__, block
    end

    # Generates two h6 methods to:
    # * return the text from a h6;
    # * return the h6 element.
    #
    # @param [Symbol] name The name of the h6 element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a h6 to generate methods
    # h6 :my_element, :id => "my_element"
    # page.my_element.should == "My Element Text"
    # page.my_element_h6.exist?.should be_true
    def h6 name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_h6").text
      end
      create_element_getter "#{name}_h6", identifier, __method__, block
    end

    # Generates two div methods to:
    # * return the text from a div;
    # * return the div element.
    #
    # @param [Symbol] name The name of the div element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a div to generate methods
    # div :my_element, :id => "my_element"
    # page.my_element.should == "My Element Text"
    # page.my_element_div.exist?.should be_true
    def div name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_div").text
      end
      create_element_getter "#{name}_div", identifier, __method__, block
    end

    # Generates two span methods to:
    # * return the text from a span;
    # * return the span element.
    #
    # @param [Symbol] name The name of the span element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a span to generate methods
    # span :my_element, :id => "my_element"
    # page.my_element.should == "My Element Text"
    # page.my_element_span.exist?.should be_true
    def span name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_span").text
      end
      create_element_getter "#{name}_span", identifier, __method__, block
    end

    # Generates two p methods to:
    # * return the text from a p;
    # * return the p element.
    #
    # @param [Symbol] name The name of the p element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a p to generate methods
    # p :my_element, :id => "my_element"
    # page.my_element.should == "My Element Text"
    # page.my_element_p.exist?.should be_true
    def p name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_p").text
      end
      create_element_getter "#{name}_p", identifier, __method__, block
    end

    # Generates two dl methods to:
    # * return the text from a dl;
    # * return the dl element.
    #
    # @param [Symbol] name The name of the dl element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a dl to generate methods
    # dl :my_element, :id => "my_element"
    # page.my_element.should == "My Element Text"
    # page.my_element_dl.exist?.should be_true
    def dl name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_dl").text
      end
      create_element_getter "#{name}_dl", identifier, __method__, block
    end

    # Generates two dd methods to:
    # * return the text from a dd;
    # * return the dd element.
    #
    # @param [Symbol] name The name of the dd element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a dd to generate methods
    # dd :my_element, :id => "my_element"
    # page.my_element.should == "My Element Text"
    # page.my_element_dd.exist?.should be_true
    def dd name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_dd").text
      end
      create_element_getter "#{name}_dd", identifier, __method__, block
    end

    # Generates two dt methods to:
    # * return the text from a dt;
    # * return the dt element.
    #
    # @param [Symbol] name The name of the dt element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a dt to generate methods
    # dt :my_element, :id => "my_element"
    # page.my_element.should == "My Element Text"
    # page.my_element_dt.exist?.should be_true
    def dt name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_dt").text
      end
      create_element_getter "#{name}_dt", identifier, __method__, block
    end

    # Generates two form methods to:
    # * return the text from a form;
    # * return the form element.
    #
    # @param [Symbol] name The name of the form element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a form to generate methods
    # form :my_element, :id => "my_element"
    # page.my_element.should == "My Element Text"
    # page.my_element_form.exist?.should be_true
    def form name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_form").text
      end
      create_element_getter "#{name}_form", identifier, __method__, block
    end

    # Generates two li methods to:
    # * return the text from a li;
    # * return the li element.
    #
    # @param [Symbol] name The name of the li element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a li to generate methods
    # li :my_element, :id => "my_element"
    # page.my_element.should == "My Element Text"
    # page.my_element_li.exist?.should be_true
    def li name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_li").text
      end
      create_element_getter "#{name}_li", identifier, __method__, block
    end

    # Generates two link methods to:
    # * click a link;
    # * return the link element.
    #
    # @param [Symbol] name The name of the link element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a link to generate methods
    # link :info, :text => "Information"
    # page.info
    # page.info_link.exist?.should be_true
    def link name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_link").click
      end
      create_element_getter "#{name}_link", identifier, __method__, block
    end

    # Generates two button methods to:
    # * click a button;
    # * return the button element.
    #
    # @param [Symbol] name The name of the button element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a button to generate methods
    # button :info, :text => "Information"
    # page.info
    # page.info_button.exist?.should be_true
    def button name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_button").click
      end
      create_element_getter "#{name}_button", identifier, __method__, block
    end

    # Generates three text_field methods to:
    # * set a text_field;
    # * get a text_field's value; and
    # * return the text_field element.
    #
    # @param [Symbol] name The name of the text_field element (used to generate the methods)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a text_field to generate methods
    # text_field first_name, :name => "firstname"
    # page.first_name = "Finley" #set
    # page.first_name.should == "Finley" #check
    # page.first_name_text_field.exists?.should be_true #object
    def text_field name, identifier=nil, &block
      define_method(name) do
        self.send("#{name}_text_field").value
      end
      define_method("#{name}=") do |value|
        self.send("#{name}_text_field").set value
      end
      create_element_getter "#{name}_text_field", identifier, __method__, block
    end

    # Generates a table method to return a table element.
    # @param [Symbol] name The name of the table element (used to generate the method)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a table to generate a method
    #   table :my_element, :id => 'my_element'
    #   page.my_element.exists?.should be_true
    def table name, identifier=nil, &block
      create_element_getter "#{name}", identifier, __method__, block
    end

    # Generates a image method to return a image element.
    # @param [Symbol] name The name of the image element (used to generate the method)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a image to generate a method
    #   table :my_element, :id => 'my_element'
    #   page.my_element.exists?.should be_true
    def image name, identifier=nil, &block
      create_element_getter "#{name}", identifier, __method__, block
    end

    # Generates a frame method to return a frame element.
    # @param [Symbol] name The name of the frame element (used to generate the method)
    # @param [optional, Hash] identifier A set of key, value pairs to identify the element
    # @param block
    # @return [Nil]
    #
    # @example Specify a frame to generate a method
    #   table :my_element, :id => 'my_element'
    #   page.my_element.exists?.should be_true
    def frame name, identifier=nil, &block
      create_element_getter "#{name}", identifier, __method__, block
    end
  end
end
