# frozen_string_literal: true

10.times do |number|
  Patient.create!(first_name: 'First_Name', last_name: "Last Name#{number}", pesel: "1234567890#{number}",
                  gender: 'male', date_of_birth: '1990-01-01', city: 'City')
end
