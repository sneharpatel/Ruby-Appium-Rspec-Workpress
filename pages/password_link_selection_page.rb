require_relative '../spec/spec_helper'
require_relative 'app_object'
require_relative 'landing_page'
require_relative 'login_email_page'
require_relative 'login_password_page'


class PasswordLinkSelectionPage < BasePage

  def initialize(driver)
    super(driver)
  end

  def isPageLoaded
    wait_for{select_your_password_link.displayed?}
  end

  def select_your_password_link
    (ENV["platform"] == "ios") ?
        @driver.find_element(:accessibility_id, "Use Password") :
        @driver.find_element(:id, 'org.wordpress.android:id/login_enter_password')
  end

  def select_your_password_link_click
    select_your_password_link.click
    return LoginPasswordPage.new(@driver)
  end


end



