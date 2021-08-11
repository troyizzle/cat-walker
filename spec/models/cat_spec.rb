# frozen_string_literal: true

# == Schema Information
#
# Table name: cats
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  name       :string
#  breed      :string
#  weight     :integer
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe Cat, type: :model do
  describe "associatons" do
    it { is_expected.to have_many(:appointments).class_name("Appointment").dependent(:destroy) }
    it { is_expected.to belong_to(:user).class_name("User") }
    it { is_expected.to have_one_attached(:picture) }
  end

  describe "database" do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:breed).of_type(:string) }
    it { is_expected.to have_db_column(:weight).of_type(:integer) }
    it { is_expected.to have_db_column(:birthday).of_type(:datetime) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "validations" do
    subject { build(:cat) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:breed) }
    it { is_expected.to validate_presence_of(:picture) }
    it { is_expected.to validate_content_type_of(:picture).allowing(described_class::ALLOWED_PICTURE_TYPES) }
    # TODO: 'Make a helper to exclude mime types and check verus rest'
    it { is_expected.to validate_content_type_of(:picture).rejecting("text/plain") }
  end
end
