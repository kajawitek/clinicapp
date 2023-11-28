# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    date_and_time { Faker::Date.between(from: DateTime.now, to: DateTime.now + 30) }
    price { Faker::Number.decimal(l_digits: 2) }
    patient
    doctor
  end
end
