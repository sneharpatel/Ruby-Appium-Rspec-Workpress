require "rspec/expectations"
require "appium_lib"
require "rspec"
require "selenium-webdriver"
require "require_all"

begin
  require_all "#{File.join(File.expand_path(File.dirname(__FILE__)), '..', 'pages')}"
rescue
  puts "no page objects found"
end

RSpec.configure do | config |

  config.before(:each) do | example |

    if ENV['platform'] == 'ios'
      caps = {
        caps: {
          platformName: "iOS",
          platformVersion: "11.3",
          deviceName: "iPhone 7",
          automationName: "XCUITest",
          app: ENV["wordpress_app_location"]
        }
      }
    elsif ENV['platform'] == 'android'
      caps = {
        caps: {
          automationName: "UiAutomator2",
          platformName: "Android",
          platformVersion: "6.0",
          deviceName: "Nexus 6",
          name: example.full_description,
          autoLaunch: false,
          autoAcceptAlerts: true,
          appActivity: 'org.wordpress.android.ui.accounts.LoginActivity',
          app: ENV["wordpress_app_location"]
        }
      }

    else
      raise 'Wrong platform'
    end

    @driver = Appium::Driver.new(caps)
    @driver.start_driver
    if ENV['platform'] == 'android'
      @driver.start_activity app_package: "org.wordpress.android", app_activity: "org.wordpress.android.ui.accounts.LoginActivity"
    end
    @driver.launch_app


  end

  config.after(:each) do | example |
    return if @driver == nil?
    @driver.driver_quit
    puts "job-name=#{example.full_description} done."
  end

  #Explicit wait definition
  def wait_for
    Selenium::WebDriver::Wait.new(:timeout => 10).until { yield }
  end


end
