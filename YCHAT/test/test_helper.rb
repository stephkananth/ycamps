require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
# require 'minitest'
# require 'minitest/rails'
# require 'minitest/reporters'
# require 'minitest_extensions'
require 'contexts'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  include Contexts

  # Add the infamous deny method...
  def deny(condition, msg = '')
    # a simple transformation to increase readability IMO
    assert !condition, msg
  end

  # Spruce up minitest results...
  # Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]
end
