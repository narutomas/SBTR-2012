# encoding: utf-8

ENV["RAILS_ENV"] = "test"

ENV["ADMIN_PASSWORD"] = "5ebe2294ecd0e0f08eab7690d2a6ee69"

ENV["AWS_ACCESS_KEY_ID"] = "secret"
ENV["AWS_SECRET_ACCESS_KEY"] = "secret"

require File.expand_path('../../config/environment', __FILE__)

require 'peck/flavors/vanilla'
require 'peck_on_rails'

require 'rails/test_help'

%w(
  test/test_helper
).each do |path|
  Dir.glob(Rails.root + path + '**/*.rb').each { |file| require file }
end

class ActiveSupport::TestCase
  fixtures :all

  include TestHelper::Assertions
end

class ActionController::TestCase
  #include TestHelper::CookieAuthentication
  #include TestHelper::Preferences

  #def start_url
    #@controller.send(:start_url)
  #end
end
