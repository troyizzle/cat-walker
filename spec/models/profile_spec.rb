# frozen_string_literal: true

# == Schema Information
#
# Table name: profiles
#
#  id           :bigint           not null, primary key
#  first_name   :string
#  last_name    :string
#  phone_number :bigint
#  address      :string
#  city         :string
#  zip          :integer
#  state        :string
#  user_id      :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "rails_helper"

RSpec.describe Profile, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user).class_name("User") }
  end

  describe "database" do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:phone_number).of_type(:string) }
    it { is_expected.to have_db_column(:address).of_type(:string) }
    it { is_expected.to have_db_column(:city).of_type(:string) }
    it { is_expected.to have_db_column(:zip).of_type(:integer) }
    it { is_expected.to have_db_column(:state).of_type(:string) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "validations" do
    it { is_expected.to validate_content_type_of(:avatar).allowing(described_class::ALLOWED_AVATAR_TYPES) }
    # TODO: 'Make a helper to exclude mime types and check verus rest'
    it { is_expected.to validate_content_type_of(:avatar).rejecting("text/plan") }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:zip) }
    it { is_expected.to validate_inclusion_of(:state).in_array CS.states(:us).keys.map(&:to_s) }
  end

  describe "ALLOWED_AVATAR_TYPES" do
    subject { described_class::ALLOWED_AVATAR_TYPES }

    it { is_expected.to eq(["image/png", "image/jpeg", "image/gif", "image/bmp", "image/tiff", "image/svg+xml"]) }
  end
end
