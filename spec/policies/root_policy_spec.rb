# frozen_string_literal: true

require "rails_helper"

RSpec.describe RootPolicy, type: :policy do
  subject { described_class.new(user) }

  context "when user is nil" do
    let(:user) { nil }

    it { is_expected.to forbid_action("select_walk_duration") }
  end

  context "when user is present" do
    let(:user) { build(:user) }

    it { is_expected.to permit_action("select_walk_duration") }
  end

  context "when user is an admin" do
    let(:user) { build(:user, :admin) }

    it { is_expected.to permit_action("select_walk_duration") }
  end
end
