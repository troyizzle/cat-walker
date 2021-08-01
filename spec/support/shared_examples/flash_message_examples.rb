# frozen_string_literal: true

RSpec.shared_examples "flash message examples" do |type, msg|
  it { expect(flash[type]).to eq(msg) }
end
