# frozen_string_literal: true

require "rails_helper"

RSpec.describe Book, type: :model do
  describe "database" do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
  end

  describe "validations" do
    subject { build(:book) }

    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:time) }
    it { is_expected.to validate_uniqueness_of(:time).scoped_to(:appointment_type) }
    it { is_expected.to validate_presence_of(:icon) }
  end
end
