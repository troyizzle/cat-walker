# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :appointments, dependent: :nullify

  validates :price, presence: true
  validates :time, presence: true, uniqueness: { scope: :appointment_type }
  validates :icon, presence: true

  enum appointment_type: { walk: 0 }
end
