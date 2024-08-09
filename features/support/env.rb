require "capybara"
require "capybara/cucumber"
require "faker"


Capybara.configure do | config |
  config.default_driver = :selenium_chrome
  config.app_host = "http://rocklov-web:3000"
  config.default_max_wait_time = 10 # Time out implicito para achar o elemento da página
end
