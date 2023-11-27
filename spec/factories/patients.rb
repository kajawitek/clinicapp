# frozen_string_literal: true

FactoryBot.define do
  factory :patient do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    pesel { Faker::Number.number(digits: 11) }
    gender { Patient.genders.values.sample }
    date_of_birth { Faker::Date.between(from: 150.years.ago, to: Time.zone.today) }
    city { Faker::Address.city }
  end
end
