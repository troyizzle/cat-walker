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
FactoryBot.define do
  factory :profile do
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    phone_number { "123-456-7890" }
    address { Faker::Address.street_name }
    city { "Apopka" }
    zip { "32703" }
    state { "FL" }
    user
    avatar { upload_file(Rails.root.join("public/images/default.png")) }
  end
end
