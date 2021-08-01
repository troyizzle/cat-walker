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
class Walker < ApplicationRecord
  belongs_to :user

  validates :zip, presence: true
  validates :range, presence: true, numericality: { greater_than: 0, less_than: 50 }
  validates :terms, presence: true, acceptance: true
end
