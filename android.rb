require 'test/unit'
require 'appium_lib'

class TestYourAndroidApp < Test::Unit::TestCase
 def setup
     desired_caps = {
         caps: {
            accessKey: ENV['accessKey'],
            platformName: 'android',
            testName: 'Android App test',
            app: 'cloud:com.experitest.ExperiBank/.LoginActivity',
            appPackage: 'com.experitest.ExperiBank',
            appActivity: '.LoginActivity'
                 },
            appium_lib: {
              server_url: 'https://cloud.experitest.com:443/wd/hub',
            }
     }
     @driver = Appium::Driver.new(desired_caps)
     @driver.start_driver
 end
 
 def test_android
   @driver.find_element(:xpath, "//*[@id='Username']").send_keys 'company'
   @driver.find_element(:xpath, "//*[@id='Password']").send_keys 'company'
   @driver.find_element(:xpath, "//*[@id='loginButton']").click
   @driver.find_element(:xpath, "//*[@text='Make Payment']").click
   @driver.find_element(:xpath, "//*[@id='Phone']").send_keys '123456'
   @driver.find_element(:xpath, "//*[@id='Name']").send_keys 'Test'
   @driver.find_element(:xpath, "//*[@id='Amount']").send_keys '5'
   @driver.find_element(:xpath, "//*[@id='Country']").send_keys 'US'
   @driver.find_element(:xpath, "//*[@text='Send Payment']").click
   @driver.find_element(:xpath, "//*[@text='Yes']").click
 end
 
 def teardown
     @driver.driver_quit
 end
end
