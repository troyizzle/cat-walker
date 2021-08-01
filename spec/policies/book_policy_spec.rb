# frozen_string_literal: true

require "rails_helper"

RSpec.describe BookPolicy, type: :policy do
  subject { described_class.new(user, book) }

  let(:book) { build(:book) }
  let(:actions) { %i[index show new edit create update destroy] }

  context "when user is nil" do
    let(:user) { nil }

    it { is_expected.to forbid_actions(actions) }
  end

  context "when user is present and not an admin" do
    let(:user) { build(:user) }

    it { is_expected.to forbid_actions(actions) }
  end

  context "when user is present and an admin" do
    let(:user) { build(:user, :admin) }

    it { is_expected.to permit_actions(actions) }
  end
end
