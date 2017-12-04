require 'test/unit'
require 'appium_lib'

class TestYourWebAppAndroid < Test::Unit::TestCase
  def setup
    desired_caps = {
        caps: {
            accessKey: ENV['SEETEST_IO_ACCESS_KEY'],
            platformName: 'android',
            testName: 'Android Web Test with Ruby',
            browserName: 'chrome',

        },
        appium_lib: {
            server_url: 'https://beta.seetest.io:443/wd/hub',
        }
    }
    @driver = Appium::Driver.new(desired_caps, true).start_driver
  end

  def test_android_web
    @driver.get('https://amazon.com')
    @driver.find_element(:xpath, "//*[@name='k']").send_keys 'iPhone'
    search_btn = @driver.find_element(:xpath, "//*[@value='Go']")
    search_btn.click
  end

  def teardown
    puts @driver.capabilities['reportUrl']
    @driver.quit
  end
end
