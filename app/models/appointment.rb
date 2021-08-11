class Appointment < ApplicationRecord
  belongs_to :walker
  belongs_to :book
  belongs_to :cat
end
