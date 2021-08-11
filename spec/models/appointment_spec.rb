# frozen_string_literal: true

require "rails_helper"

RSpec.describe Appointment, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:book).class_name("Book") }
    it { is_expected.to belong_to(:cat).class_name("Cat") }
    it { is_expected.to belong_to(:walker).class_name("Walker") }
  end
end
