# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProfilePolicy, type: :policy do
  subject { described_class.new(profile1.user, profile) }

  let(:profile1) { build(:profile) }
  let(:profile2) { build(:profile) }

  context "when user does not own profile" do
    let(:profile) { profile2 }

    it { is_expected.to forbid_actions(%i[index edit]) }
  end

  context "when user does own profile" do
    let(:profile) { profile1 }

    it { is_expected.to permit_actions(%i[index edit]) }
  end
end
