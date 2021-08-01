# frozen_string_literal: true

require "rails_helper"

RSpec.describe HomePolicy, type: :policy do
  subject { described_class.new(user) }

  context "when no user is present" do
    let(:user) { nil }

    it { is_expected.to forbid_action(:index) }
  end

  context "when user is present" do
    let(:user) { build(:user) }

    it { is_expected.to permit_action(:index) }
  end

  context "when user is an admin" do
    let(:user) { build(:user, admin: true) }

    it { is_expected.to permit_action(:index) }
  end
end
