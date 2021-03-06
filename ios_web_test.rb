require 'test/unit'
require 'appium_lib'

class TestYourWebAppiOS < Test::Unit::TestCase
  def setup
    desired_caps = {
        caps: {
            accessKey: ENV['SEETEST_IO_ACCESS_KEY'],
            platformName: 'ios',
            testName: 'iOS Web Test with Ruby',
            autoDismissAlerts: true,
            browserName: 'safari',

        },
        appium_lib: {
            server_url: 'https://cloud.seetest.io:443/wd/hub',
        }
    }
    @driver = Appium::Driver.new(desired_caps, true).start_driver
  end

  def test_ios_web
    @driver.get('https://amazon.com')
    if @driver.capabilities['device.category'].eql? 'TABLET'
      @driver.find_element(:xpath, "//*[@name='field-keywords']").send_keys 'mobile autoamtion testing'
      search_btn = @driver.find_element(:xpath, "//*[@text='Go']")
    else
      @driver.find_element(:xpath, "//*[@name='k']").send_keys 'mobile autoamtion testing'
      search_btn = @driver.find_element(:xpath, "//*[@value='Go']")
    end
  end

  def teardown
    puts @driver.capabilities['reportUrl']
    @driver.quit
  end
end
