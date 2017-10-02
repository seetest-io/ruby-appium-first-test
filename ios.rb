require 'test/unit'
require 'appium_lib'

class TestYouriOSApp < Test::Unit::TestCase
 def setup
     desired_caps = {
         caps: {
		accessKey: '<ACCESS_KEY>',
		platformName: 'ios',
		projectName: '<YOUR_PROJECT_NAME>',
		testName: '<TEST_NAME>'
		app: 'cloud:<BUNDLE_ID>',
		bundleId: '<BUNDLE_ID>',
         },
	 	appium_lib: {
			server_url: 'https://cloud.experitest.com:443/wd/hub',
		}
     }
     @driver = Appium::Driver.new(desired_caps)
     @driver.start_driver
 end
 
 def test_ios
	#run your test
 end
 
 def teardown
     @driver.driver_quit
 end
end
