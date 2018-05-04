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

    # if ENV['platform'] == 'iOS'

    # caps = {
    #     caps: {
    #         {
    #       platformName: "iOS",
    #       platformVersion: "10.3",
    #       deviceName: "iPhone 7",
    #       udid: "AB262226-0136-4C6A-B617-556F9B5334C6",
    #       automationName: "XCUITest",
    #       app: ""

    #     }
    # }
    #
    # elsif ENV['platform'] == 'Android'
    #
    # else
    #   raise 'Wrong platform'
    #
    # end



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
          app: "/Users/sneha/RubymineProjects/wordpress/WordPress-Android/WordPress/build/outputs/apk/vanilla/debug/WordPress-vanilla-debug.apk"
        }
    }

    caps.merge!({deviceType: "ENV['deviceType']"}) if ENV['deviceType'] != ''

    @driver = Appium::Driver.new(caps)
    @driver.start_driver
    @driver.start_activity app_package: "org.wordpress.android", app_activity: "org.wordpress.android.ui.accounts.LoginActivity"
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
