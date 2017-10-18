ENV['RACK_ENV'] = 'test'

require_relative '../app/app.rb'
require File.join(File.dirname(__FILE__), '/features', 'web_helpers.rb')

require 'capybara'
require 'rspec'
require 'capybara/rspec'
require 'database_cleaner'

Capybara.app = BookmarkManager


RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
 
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    
    RSpec.configure do |config|

      config.before(:suite) do
        DatabaseCleaner.strategy = :transaction
        DatabaseCleaner.clean_with(:truncation)
      end
    
      config.before(:each) do
        DatabaseCleaner.start
      end
    
      config.after(:each) do
        DatabaseCleaner.clean
      end
    end
  end


  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
