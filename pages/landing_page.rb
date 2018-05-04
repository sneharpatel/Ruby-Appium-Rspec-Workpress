require_relative '../spec/spec_helper'
require_relative 'app_object'
require_relative 'login_password_page'


class LandingPage < BasePage

  #constructor of the landing page will call constructor of base page because we have single instance of driver being passed from one object to the next when we create new objects

  def initialize(driver)
    super(driver)
  end

  def isPageLoaded
    wait_for{login_button.displayed?}
  end

  def login_button
    @driver.find_element(:id, 'login_button')
  end

  def login_button_click
    login_button.click
    return LoginEmailPage.new(@driver)
  end

end
