require './browser'

user = Browser.new :chrome
user.login_as_user
lease_volume = user.browser.div(id: 'calendar-leases').h3.div(index: 0).text

test = 'Testing the user login'
if lease_volume == 'Lease Volume'
  puts "#{test}: passed!"
else
  puts "#{test}: failed!"
end
