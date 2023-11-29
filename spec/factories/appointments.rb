# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    price { Faker::Number.decimal(l_digits: 2) }
    patient
    appointment_slot
  end
end
