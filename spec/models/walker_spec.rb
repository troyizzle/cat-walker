# frozen_string_literal: true

# == Schema Information
#
# Table name: walkers
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  terms      :boolean
#  zip        :integer
#  range      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe Walker, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user).class_name("User") }
    it { is_expected.to have_many(:appointments).class_name("Appointment").dependent(:nullify) }
  end

  describe "database" do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:terms).of_type(:boolean) }
    it { is_expected.to have_db_column(:zip).of_type(:integer) }
    it { is_expected.to have_db_column(:range).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "validations" do
    subject { build(:walker) }

    it { is_expected.to validate_presence_of(:zip) }
    it { is_expected.to validate_numericality_of(:range).is_greater_than(0).is_less_than(50) }
    it { is_expected.to validate_presence_of(:terms) }
    # TODO: Test that this is only valid with true in terms
    # it { should validate_inclusion_of(:terms).in_array [true] }
  end
end
