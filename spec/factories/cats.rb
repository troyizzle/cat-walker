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
FactoryBot.define do
  factory :cat do
    name { Faker::Name.name }
    breed { Faker::Name.name }

    trait :with_picture do
      file_path = Rails.root.join("public/images/default.png")
      picture { Rack::Test::UploadedFile.new(file_path) }
    end
  end
end
