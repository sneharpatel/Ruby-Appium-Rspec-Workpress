require_relative '../spec/spec_helper'

class BasePage
  attr_accessor :driver

  def initialize(driver)
    @driver = driver
    isPageLoaded()
  end

  def isPageLoaded
    raise "Page Load validation not implemented for Page #{self.name}"
  end
end
