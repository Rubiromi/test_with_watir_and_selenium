require 'watir-webdriver'
require 'headless' if ENV['HEADLESS']

class Browser
  attr_reader :browser

  def initialize(browser_name)
    # HEADLESS launchs chrome in a XVFB frame buffer on Linux machine that aren't running X.
    if ENV['HEADLESS']
      headless = Headless.new
      headless.start
    end

    client = Selenium::WebDriver::Remote::Http::Default.new
    @browser = Watir::Browser.new browser_name.to_sym, { http_client: client }
  end

  def login_as_user
    @browser.goto "http://clinton:3000/user_login"
    @browser.text_field(id: 'username').set 'aaron'
    @browser.text_field(id: 'password').set 'aoeuaoeu'
    @browser.a(id: 'login_button').click

    until @browser.div(id: 'calendar-leases').exists?
      sleep 1
    end
  end

  def login_as_merchant
    @browser.goto "http://clinton:3000"
    @browser.a(class: 'sf-button').click
    @browser.text_field(id: 'username').set 'clinton@axisavant.com'
    @browser.text_field(id: 'password').set 'aoeuaoeu'
    @browser.a(id: 'login_button').click

    until @browser.div(id: 'alert_ie_users').exists?
      sleep 1
    end
  end
end
