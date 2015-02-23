require './browser'

merchant = Browser.new :chrome
merchant.login_as_merchant
get_approved = merchant.browser.h3(xpath: '/html/body/div[3]/div/div/div[3]/div[1]/div/div/h3').text

test = 'Testing the merchant login'
if get_approved == 'Get Approved'
  puts "#{test}: passed!"
else
  puts "#{test}: failed!"
end

