# frozen_string_literal: true

100.times do
  patient = FactoryBot.create(:patient)
  Rails.logger.debug { "## Created Patient: #{patient.first_name} #{patient.last_name}" }
end

20.times do
  doctor = FactoryBot.create(:doctor)
  Rails.logger.debug { "## Created Doctor: #{doctor.first_name} #{doctor.last_name}" }
end
