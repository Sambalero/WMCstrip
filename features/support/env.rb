TEST_DATA_DIR = "./features/support/test_data"
$: << File.dirname(__FILE__)+'/../../lib'

require 'watir-webdriver'
require 'watir-page-helper/commands'

World WatirPageHelper::Commands
# apparently the world method means 'include module' or 'If you want to make these module methods available to your cucumber step definitions, you can use the World method:' http://pivotallabs.com/cucumber-step-definitions-are-not-methods/

WatirPageHelper.create
#create is apparently in commands and creates a browser instance.

After do
  WatirPageHelper.browser.cookies.clear
end


  at_exit do
    WatirPageHelper.close
  end

