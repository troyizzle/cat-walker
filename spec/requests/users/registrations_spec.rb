# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Users::Registrations", type: :request do
  # CREATE
  describe "POST /create" do
    let(:cat_params) { attributes_for(:cat, :with_picture) }
    let(:profile_params) { attributes_for(:profile) }
    let(:user_params) { attributes_for(:user) }
    let(:valid_params) do
      user_params.merge(profile_attributes: profile_params)
    end

    let(:invalid_params) { valid_params.tap { |p| p.delete(:username) } }

    context "with valid params" do
      let(:post_user) { post user_registration_url, params: { user: valid_params } }

      it "creates a new user" do
        expect { post_user }.to change(User, :count).by(1)
      end

      it "creates a new profile" do
        expect { post_user }.to change(Profile, :count).by(1)
      end

      it "attachs an avatar" do
        post_user
        expect(Profile.last.avatar).to be_attached
      end

      it "redirects to home page" do
        post_user
        expect(response).to redirect_to(home_index_url)
      end
    end

    context "with invalid params" do
      let(:post_user) { post user_registration_url, params: { user: invalid_params } }

      it "does not create a new User" do
        expect { post_user }.to change(User, :count).by(0)
      end

      it "renders a successfully response" do
        post_user
        expect(response).to be_successful
      end

      it "renders assign with errors" do
        post_user
        expect(assigns[:resource].errors).not_to be_empty
      end
    end
  end
end
