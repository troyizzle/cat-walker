# frozen_string_literal: true

require "rails_helper"

RSpec.describe "db:seed:book:" do
  let(:run_seeds) { Rake::Task["db:seed:book"] }

  before(:each) { Rails.application.load_tasks }

  it "creates 3 books" do
    expect { run_seeds.execute }.to change(Book, :count).by(3)
  end
end
