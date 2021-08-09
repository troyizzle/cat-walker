# frozen_string_literal: true

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

def upload_file(file)
  content = File.open(file).read
  tempfile = Tempfile.open
  tempfile.write content
  tempfile.rewind

  Rack::Test::UploadedFile.new(tempfile)
end
