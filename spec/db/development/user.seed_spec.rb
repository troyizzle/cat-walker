# frozen_string_literal: true

require "rails_helper"

RSpec.describe "db:seed:development:user" do
  run_seed { Rake::Task["db:seed:development:user"] }

  before(:each) { Rails.application.load_tasks }

  it "creates 5 users" do
    expect { run_seed.execute }.to change(User, :count).by(5)
  end
end
