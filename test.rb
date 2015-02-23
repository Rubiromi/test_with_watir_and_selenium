# require "./browser"
# require 'json'
# require 'nokogiri'
#
# merchant = Browser.new :chrome
# mb = merchant.browser
# p merchant
# p mb
#
# user = Browser.new :firefox
# ub = user.browser
#
# ub.goto "http://clinton:3000/user_login"
#
# mb.goto "http://clinton:3000"


# browser.goto "http://clinton:3000/user_login"
#
# browser.text_field(id: "username").set "aaron"
# browser.text_field(id: "password").set "aoeuaoeu"
# browser.a(id: "login_button").click
# until browser.div(id: "calendar-leases").exists?
#   sleep 1
# end
# lease_volume = browser.div(id: "calendar-leases").h3.div(index: 0).text
# if lease_volume == "Lease Volume"
#   puts "It passed!"
# else
#   puts "It failed!"
# end
