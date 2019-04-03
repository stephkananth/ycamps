require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'
require 'minitest'
require 'minitest/rails'
require 'minitest/reporters'
# require 'minitest_extensions'
require 'contexts'

class ActiveSupport::TestCase
  include Contexts

  def deny(condition, msg = '')
    assert !condition, msg
  end
end
