# frozen_string_literal: true
# Configs of possible browsers
module Browsers

    def self.register_chrome(app)
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument("no-sandbox")
      options.add_argument("disable-gpu")
      options.add_argument("ignore-certificate-errors")
      options.add_argument("window-size=1600,1300")
      options.add_argument("test-type")
      options.add_argument("incognito")
      options.add_argument("start-maximized")
      options.add_argument('disable-dev-shm-usage')
      options.add_argument('disable-extensions')
  
      Capybara::Selenium::Driver.new(
        app,
        browser: :chrome,
        http_client: client,
        options: options
      )
    end
  
    def self.proxy_options
      {
        proxyType: 'manual',
        httpProxy: '10.240.58.39:8080',
        sslProxy: '10.240.58.39:8080',
        noProxy: 'localhost,*.local,127.0.0.1'
      }
    end
  
    def self.register_chromeheadless(app)
      capabilities = Selenium::WebDriver::Remote::Capabilities.chrome
      capabilities[:page_load_strategy]= "none"
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument("headless")
      options.add_argument("no-sandbox")
      options.add_argument("disable-gpu")
      options.add_argument("ignore-certificate-errors")
      options.add_argument("window-size=1600,1300")
      options.add_argument("test-type")
      options.add_argument("incognito")
      options.add_argument("start-maximized")
      options.add_argument('disable-dev-shm-usage')
      options.add_argument('disable-extensions')
      options.add_argument('user-agent=Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36')
      Capybara::Selenium::Driver.new(
        app,
        browser: :chrome,
        http_client: client,
        options: options,
        desired_capabilities: capabilities
      )
    end
  
    def self.register_firefox(app)
      Capybara::Selenium::Driver.new(app, browser: :firefox)
    end
  
    def self.register_firefoxheadless(app)
      capabilities = Selenium::WebDriver::Remote::Capabilities.firefox(accept_insecure_certs: true)
      options = ::Selenium::WebDriver::Firefox::Options.new
      options.args << '--headless'
  
      Capybara::Selenium::Driver.new(
        app,
        browser: :firefox,
        desired_capabilities: capabilities,
        options: options
      )
    end
  
    def self.register_poltergeist(app)
      options = {
        js_errors: false,
        timeout: 900,
        debug: true,
        phantomjs_options: [
          '--load-images=no', '--disk-cache=false', '--ignore-ssl-errors=yes'
        ],
        inspector: true
      }
      Capybara::Poltergeist::Driver.new(app, options)
    end
  
    def self.register_remote_chrome(app)
      abort 'REMOTE_HOST must be specified' if REMOTE_HOST.nil?
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument("headless")
      options.add_argument("no-sandbox")
      options.add_argument("disable-gpu")
      options.add_argument("ignore-certificate-errors")
      options.add_argument("window-size=1600,1300")
      options.add_argument("test-type")
      options.add_argument("incognito")
      Capybara::Selenium::Driver.new(
        app,
        browser: :chrome,
        http_client: client,
        options: options,
        url: REMOTE_HOST,
        desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome
      )
    end
  
    def self.client
      client = Selenium::WebDriver::Remote::Http::Default.new
      client.open_timeout = 120 # seconds
      client.read_timeout = 240 # seconds
      client
    end
  end