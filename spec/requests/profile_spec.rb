# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Profile", type: :request do
  describe "GET /profile" do
    let(:get_path) { get "/profile" }

    let(:user) { build(:user) }

    context "when no user" do
      before(:each) { get_path }

      include_examples "unauthenticated examples"
    end

    context "without allowed permissions" do
      # TODO: Clean up these before blocks into a get_path and pass in the policy?
      before(:each) do
        allow(ProfilePolicy).to receive(:new).and_return(NoPolicy.new)
        sign_in user
        get_path
      end

      include_examples "unauthorized examples"
    end

    context "with allowed permissions" do
      before(:each) do
        allow(ProfilePolicy).to receive(:new).and_return(YesPolicy.new)
        sign_in user
        get_path
      end

      include_examples "successful examples", :index
    end
  end

  describe "GET /profile/edit" do
    let(:get_path) { get "/profile/edit" }

    context "when no user" do
      before(:each) { get_path }

      include_examples "unauthenticated examples"
    end

    context "without allowed permissions" do
      login_user

      before(:each) do
        allow(ProfilePolicy).to receive(:new).and_return(NoPolicy.new)
        get_path
      end

      include_examples "unauthorized examples"
    end

    context "with allowed permissions" do
      login_user

      before(:each) do
        allow(ProfilePolicy).to receive(:new).and_return(YesPolicy.new)
        get_path
      end

      include_examples "successful examples", :edit
    end
  end

  describe "PUT /profile" do
    let(:get_path) { put "/profile", params: params }

    let(:valid_params) { attributes_for(:profile, user: current_user, first_name: "bar") }

    context "when no user" do
      let(:params) { {} }

      before(:each) { get_path }

      include_examples "unauthenticated examples"
    end

    context "without allowed permissions" do
      login_user
      let(:params) { { "profile" => valid_params } }

      before(:each) do
        allow(ProfilePolicy).to receive(:new).and_return(NoPolicy.new)
        get_path
      end

      include_examples "unauthorized examples"
    end

    context "with allowed permissions" do
      login_user
      let(:params) { { profile: valid_params } }

      before(:each) do
        current_user.profile.update(first_name: "foo")
        allow(ProfilePolicy).to receive(:new).and_return(YesPolicy.new)
        get_path
      end

      include_examples "update examples",
                       :index,
                       { type: :notice, message: "Profile was successfully updated" },
                       { model: :profile, field: :first_name, eq: "bar" }
    end
  end
end
