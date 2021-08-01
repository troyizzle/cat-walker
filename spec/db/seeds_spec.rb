# frozen_string_literal: true

require "rails_helper"
require "rake"

RSpec.describe "db:seed" do
  let(:run_seed) { Rake::Task["db:seed"] }

  before(:each) { Rails.application.load_tasks }

  it "runs all the default seedfiles without error" do
    expect { run_seed }.not_to raise_error
    run_seed.reenable
  end
end
