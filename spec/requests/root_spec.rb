# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Roots", type: :request do
  describe "GET /select-walk-duration" do
    let(:get_walk_duration) { get "/select-walk-duration" }

    context "when no user" do
      before(:each) { get_walk_duration }

      include_examples "unauthenticated examples"
    end

    context "without allowed permissions" do
      login_user

      before(:each) do
        allow(RootPolicy).to receive(:new).and_return(NoPolicy.new)
        get_walk_duration
      end

      include_examples "unauthorized examples"
    end

    context "with allowed permissions" do
      login_user

      before(:each) do
        allow(RootPolicy).to receive(:new).and_return(YesPolicy.new)
        get_walk_duration
      end

      include_examples "successful examples", :select_walk_duration
    end
  end
end
