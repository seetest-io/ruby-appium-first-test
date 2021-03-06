require 'test/unit'
require 'appium_lib'

class TestYourAndroidApp < Test::Unit::TestCase
 def setup
     desired_caps = {
         caps: {
             accessKey: ENV['SEETEST_IO_ACCESS_KEY'],
             platformName: 'android',
             testName: 'Android App test with Ruby',
             app: 'http://d242m5chux1g9j.cloudfront.net/eribank.apk',
             appPackage: 'com.experitest.ExperiBank',
             appActivity: '.LoginActivity'
                 },
         appium_lib: {
              server_url: 'https://cloud.seetest.io:443/wd/hub',
            }
     }
     @driver = Appium::Driver.new(desired_caps).start_driver
 end
 
 def test_android_app
   @driver.find_element(:xpath, "//*[@id='usernameTextField']").send_keys 'company'
   @driver.find_element(:xpath, "//*[@id='passwordTextField']").send_keys 'company'
   @driver.find_element(:xpath, "//*[@id='loginButton']").click
   @driver.find_element(:xpath, "//*[@id='makePaymentButton']").click
   @driver.find_element(:xpath, "//*[@id='phoneTextField']").send_keys '123456'
   @driver.find_element(:xpath, "//*[@id='nameTextField']").send_keys 'Test'
   @driver.find_element(:xpath, "//*[@id='amountTextField']").send_keys '5'
   @driver.find_element(:xpath, "//*[@id='countryTextField']").send_keys 'US'
   @driver.find_element(:xpath, "//*[@id='sendPaymentButton']").click
   @driver.find_element(:xpath, "//*[@id='button1']").click
 end
 
 def teardown
   puts @driver.capabilities['reportUrl']
   @driver.quit
 end
end
