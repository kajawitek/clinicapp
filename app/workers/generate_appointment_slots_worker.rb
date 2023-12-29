# frozen_string_literal: true

class GenerateAppointmentSlotsWorker
  include Sidekiq::Worker

  def perform
    Rake::Task['data_completion:generate_slots'].invoke
  end
end
