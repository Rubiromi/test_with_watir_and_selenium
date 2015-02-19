require 'watir-webdriver'
require 'headless' if ENV['HEADLESS']
require 'json'
require 'nokogiri'

if ENV['HEADLESS']
  headless = Headless.new
  headless.start
end

client = Selenium::WebDriver::Remote::Http::Default.new
browser = Watir::Browser.new :chrome, http_client: client
browser.goto "http://clinton:3000/user_login"

browser.text_field(id: "username").set "aaron"
browser.text_field(id: "password").set "aoeuaoeu"
browser.a(id: "login_button").click
until browser.div(id: "calendar-leases").exists?
  sleep 1
end
lease_volume = browser.div(id: "calendar-leases").h3.div(index: 0).text
if lease_volume == "Lease Volume"
  puts "It passed!"
else
  puts "It failed!"
end
