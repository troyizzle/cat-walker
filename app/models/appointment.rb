# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :walker
  belongs_to :book
  belongs_to :cat

  enum status: { waiting: 0, accepted: 1, in_progress: 2, completed: 3 }
end
