require 'test/unit'
require 'appium_lib'
require 'parallel_tests'

class TestYourAndroidApp < Test::Unit::TestCase
 def setup
     desired_caps = {
         caps: {
             accessKey: ENV['SEETEST_IO_ACCESS_KEY'],
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
     @driver = Appium::Driver.new(desired_caps).start_driver
 end
 
 def test_android
   @driver.get('test')
   @driver.press_keycode(10)
   @driver.find_element(:xpath, "//*[@id='usernameTextField']").send_keys 'company'
   @driver.find_element(:xpath, "//*[@id='passwordTextField']").send_keys 'company'
   @driver.find_element(:xpath, "//*[@id='loginButton']").click
   @driver.find_element(:xpath, "//*[@id='makePaymentButton']").click
   @driver.find_element(:xpath, "//*[@id='phoneTextField']").send_keys '123456'
   @driver.find_element(:xpath, "//*[@id='nameTextField']").send_keys 'Test'
   @driver.find_element(:xpath, "//*[@id='amountTextField']").send_keys '5'
   @driver.find_element(:xpath, "//*[@id='countryTextField']").send_keys 'US'
   @driver.find_element(:xpath, "//*[@text='sendPaymentButton']").click
   @driver.find_element(:xpath, "//*[@text='Yes']").click
 end
 
 def teardown
   @driver.driver_quit
 end
end
