require_relative './spec_helper'
require 'rspec'
require 'time'
require 'selenium-webdriver'
require_relative '../pages/app_object'
require_relative '../pages/landing_page'
require_relative '../pages/login_email_page'
require_relative '../pages/password_link_selection_page'
require_relative '../pages/login_password_page'
require_relative '../pages/home_page'

describe "WordPress App" do

  it "should ask for login" do

    landingPage = LandingPage.new(@driver)
    homePage = landingPage.login_button_click
        .enter_email(ENV["wordpress_user_email"])
        .next_button_click
        .select_your_password_link_click
        .enter_password(ENV["wordpress_password"])
        .next_button_click
    (ENV["platform"] == "ios") ?
        expect(homePage.heading.text) == "MY SITE" :
        expect(homePage.heading.text) == "My site"

  end

end







