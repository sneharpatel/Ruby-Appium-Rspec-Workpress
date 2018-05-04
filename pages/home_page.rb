require_relative '../spec/spec_helper'
require_relative 'app_object'
require_relative 'login_password_page'

class HomePage < BasePage

  def initialize(driver)
    super(driver)
  end

  def isPageLoaded
    wait_for{heading.displayed?}
  end

  def heading
    (ENV["platform"] == "ios") ?
        @driver.find_element(:accessibility_id, "MY SITE") :
        @driver.find_element(:id, 'my_sites_heading')
  end

end