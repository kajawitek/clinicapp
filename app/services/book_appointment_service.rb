# frozen_string_literal: true

class BookAppointmentService
  attr_reader :errors

  def initialize(appointment:, appointment_slot:)
    @appointment = appointment
    @appointment_slot = appointment_slot
    @errors = []
  end

  def call
    return unless appointment_slot_is_available?

    ActiveRecord::Base.transaction do
      book_appointment
      update_appointment_slot_availability
    end
  rescue ActiveRecord::RecordInvalid => e
    errors << e.message
  end

  private

  attr_reader :appointment, :appointment_slot

  def appointment_slot_is_available?
    appointment_slot.available?
  end

  def book_appointment
    appointment.save!
  end

  def update_appointment_slot_availability
    appointment.appointment_slot.update!(available: false)
  end
end
