# frozen_string_literal: true

class AddAppointmentSlotToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_reference :appointments, :appointment_slot, null: false, foreign_key: true, default: ''
  end
end
