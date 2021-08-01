# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    price { 1.5 }
    time { 1 }
    icon { "foo" }
  end
end
