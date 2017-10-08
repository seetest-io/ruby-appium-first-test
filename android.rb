require 'test/unit'
require 'appium_lib'

class TestYourAndroidApp < Test::Unit::TestCase
 def setup
     desired_caps = {
         caps: {
		accessKey: '<ACCESS_KEY>',
		platformName: 'android',
		testName: '<TEST_NAME>'
		projectName: '<YOUR_PROJECT_NAME>',
		app: 'cloud:<BUNDLE_ID>',
		appPackage: '<BUNDLE_ID>',
		appActivity: '<ACTIVITY>' 
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
