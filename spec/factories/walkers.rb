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
FactoryBot.define do
  factory :walker do
    terms { false }
    zip { 1 }
    range { 1 }
    user
  end
end
