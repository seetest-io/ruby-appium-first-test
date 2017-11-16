require 'test/unit'
require 'appium_lib'

class TestYouriOSApp < Test::Unit::TestCase
  def setup
    desired_caps = {
        caps: {
            accessKey: ENV['SEETEST_IO_ACCESS_KEY'],
            platformName: 'android',
            testName: 'Android Web Test with Ruby',
            browserName: 'chrome',

        },
        appium_lib: {
            server_url: 'https://cloud.experitest.com:443/wd/hub',
        }
    }
    @driver = Appium::Driver.new(desired_caps, true).start_driver
  end

  def test_ios
    @driver.get('https://google.com')
    if @driver.find_elements(:xpath, "//*[@name='q']").size != 0
      @driver.find_element(:xpath, "//*[@name='q']").send_keys 'mobile autoamtion testing'
    else
      @driver.find_element(:xpath, "//*[@id='lst-ib']").send_keys 'mobile autoamtion testing'
    end

    if @driver.find_elements(:xpath, "//*[@name='btnG']").size != 0
      search_btn = @driver.find_element(:xpath, "//*[@name='btnG']")
      search_btn.click
    else
      search_btn = @driver.find_element(:xpath, "//*[@id='tsbb']")
      search_btn.click
    end

  end

  def teardown
    @driver.quit_driver
  end
end
