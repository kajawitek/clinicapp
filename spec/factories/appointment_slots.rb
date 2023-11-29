# frozen_string_literal: true

FactoryBot.define do
  factory :appointment_slot do
    date_and_time { Faker::Date.between(from: DateTime.now, to: DateTime.now + 30) }
    doctor
  end
end
