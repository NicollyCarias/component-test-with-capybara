# frozen_string_literal: true

require_relative "./browsers.rb"

require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'selenium-webdriver'


Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Browsers.send("register_chrome", app)
end

Capybara.app_host = "https://www.google.com.br"

Capybara.default_max_wait_time = 10
