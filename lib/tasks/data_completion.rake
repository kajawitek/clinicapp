# frozen_string_literal: true

namespace :data_completion do
  desc 'Update appointment slots for the next 30 days'
  task generate_slots: :environment do
    ActiveRecord::Base.transaction do
      Doctor.find_each do |doctor|
        puts "## Generating appointment slots for #{doctor.first_name} #{doctor.last_name}"

        (Date.tomorrow..Time.zone.today + 30.days).each do |date|
          start_time = date + 9.hours
          16.times do
            AppointmentSlot.find_or_create_by!(doctor: doctor, date_and_time: start_time)
            start_time += 30.minutes
          end
        end
      end
    end
    puts 'Appointment slots generated successfully!'
  rescue StandardError => e
    puts "Error generating appointment slots: #{e.message}"
  end
end
