require 'test/unit'
require 'appium_lib'

class TestYourWebAppiOS < Test::Unit::TestCase
  def setup
    desired_caps = {
        caps: {
            accessKey: ENV['SEETEST_IO_ACCESS_KEY'],
            platformName: 'ios',
            testName: 'iOS Web Test with Ruby',
            browserName: 'safari',

        },
        appium_lib: {
            server_url: 'https://beta.seetest.io:443/wd/hub',
        }
    }
    @driver = Appium::Driver.new(desired_caps, true).start_driver
  end

  def test_ios_web
    @driver.get('https://google.com')
    @driver.find_element(:xpath, "//*[@name='q']").send_keys 'mobile autoamtion testing'
    search_btn = @driver.find_element(:xpath, "//*[@name='btnG']")
    search_btn.click
  end

  def teardown
    puts @driver.capabilities['reportUrl']
    @driver.quit
  end
end
