# frozen_string_literal: true

every 1.day, at: '1:00 am' do
  runner 'GenerateAppointmentSlotsWorker.perform_async', environment: :development
end
