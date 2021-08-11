# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    walker { nil }
    book { nil }
    cat { nil }
    status { 1 }
  end
end
