# frozen_string_literal: true

require "async/eventmachine"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec, :minitest


  config.around(:example) do |example|
    if example.metadata[:em] == false
      example.run
    else
      Async::EventMachine.run do
        example.run
        Async::EventMachine.stop
      end
    end
  end
end
