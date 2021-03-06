require_relative '../spec/spec_helper'
require_relative 'app_object'
require_relative 'landing_page'
require_relative 'login_email_page'
require_relative 'login_password_page'
require_relative 'home_page'
require_relative 'password_link_selection_page'


class LoginPasswordPage < BasePage

  def initialize(driver)
    super(driver)
  end

  def isPageLoaded
    wait_for{next_button.displayed?}
  end

  def enter_password(pw)
    input = (ENV["platform"] == "ios") ? @driver.find_element(:accessibility_id, "Password") : @driver.find_element(:id, 'input')
    input.send_keys pw
    self
  end

  def next_button
    (ENV["platform"] == "ios") ?
        @driver.find_element(:accessibility_id, "Log In Button") :
        @driver.find_element(:id, 'primary_button')
  end

  def next_button_click
    next_button.click
    return HomePage.new(@driver)
  end

end