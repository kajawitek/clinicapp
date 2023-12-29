# frozen_string_literal: true

patients = FactoryBot.create_list(:patient, 100)
doctors = FactoryBot.create_list(:doctor, 20)

doctors.each do |doctor|
  FactoryBot.create_list(:appointment_slot, 20, doctor: doctor)
end

patients.each do |patient|
  FactoryBot.create_list(:appointment, 20, patient: patient, appointment_slot: AppointmentSlot.all.sample)
end
