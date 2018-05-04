require_relative '../spec/spec_helper'
require_relative 'app_object'
require_relative 'landing_page'
require_relative 'password_link_selection_page'


class LoginEmailPage < BasePage

  def initialize(driver)
    super(driver)
  end

  def isPageLoaded
    wait_for{next_button.displayed?}
  end

  def enter_email(email)
    input = (ENV["platform"] == "ios")
      ? @driver.find_element(:xpath, '//XCUIElementTypeTextField[@name="Email address"]/XCUIElementTypeTextField')
      : @driver.find_element(:id, 'input')
    input.send_keys email
    self
  end

  def next_button
    (ENV["platform"] == "ios")
      ? @driver.find_element(:accessibility_id, "Next Button")
      : @driver.find_element(:id, 'primary_button')
  end

  def next_button_click
    next_button.click
    return PasswordLinkSelectionPage.new(@driver)
  end

end