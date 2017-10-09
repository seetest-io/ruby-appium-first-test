require 'test/unit'
require 'appium_lib'

class TestYouriOSApp < Test::Unit::TestCase
 def setup
     desired_caps = {
         caps: {
            accessKey: ENV['accessKey'],
            platformName: 'ios',
            testName: 'iOS App Test',
            app: 'cloud:com.experitest.ExperiBank',
            bundleId: 'com.experitest.ExperiBank',
                 },
            appium_lib: {
              server_url: 'https://cloud.experitest.com:443/wd/hub',
		        }
     }
     @driver = Appium::Driver.new(desired_caps)
     @driver.start_driver
 end
 
 def test_ios
   @driver.find_element(:xpath, "//*[@text='Username']").send_keys 'company'
   @driver.find_element(:xpath, "//*[@text='Password']").send_keys 'company'
   @driver.find_element(:xpath, "//*[@text='loginButton']").click
   @driver.find_element(:xpath, "//*[@text='makePaymentButton']").click
   @driver.find_element(:xpath, "//*[@text='Phone']").send_keys '123456'
   @driver.find_element(:xpath, "//*[@text='Name']").send_keys 'Test'
   @driver.find_element(:xpath, "//*[@text='Amount']").send_keys '5'
   @driver.find_element(:xpath, "//*[@text='Country']").send_keys 'US'
   @driver.find_element(:xpath, "//*[@text='sendPaymentButton']").click
   @driver.find_element(:xpath, "//*[@text='Yes']").click
 end
 
 def teardown
     @driver.driver_quit
 end
end
