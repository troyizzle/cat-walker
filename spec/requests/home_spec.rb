# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Homes", type: :request do
  describe "GET /home" do
    let(:get_path) { get "/home" }

    context "when no user" do
      before(:each) { get_path }

      include_examples "unauthenticated examples"
    end

    context "without allowed permissions" do
      login_user

      before(:each) do
        allow(HomePolicy).to receive(:new).and_return(NoPolicy.new)
        get_path
      end

      include_examples "unauthorized examples"
    end

    context "with allowed permissions" do
      login_user

      before(:each) do
        allow(HomePolicy).to receive(:new).and_return(YesPolicy.new)
        get_path
      end

      include_examples "successful examples", :index
    end
  end
end
