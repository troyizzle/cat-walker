# frozen_string_literal: true

def upload_file(file)
  Rack::Test::UploadedFile.new(file)
  content = File.open(file).read
  tempfile = Tempfile.open
  tempfile.write content
  tempfile.rewind

  Rack::Test::UploadedFile.new(tempfile)
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  # Any factory that takes more than .5 seconds to create will show in the
  # console when running the tests.
  config.before(:suite) do
    ActiveSupport::Notifications.subscribe("factory_bot.run_factory") do |_name, start, finish, _id, payload|
      execution_time_in_seconds = finish - start

      if execution_time_in_seconds >= 0.5
        warn "Slow factory: #{payload[:name]} takes #{execution_time_in_seconds} seconds using strategy #{payload[:strategy]}"
      end
    end
  end
end
