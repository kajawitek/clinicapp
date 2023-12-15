# frozen_string_literal: true

class AddUniqueIndexToAppointmentSlots < ActiveRecord::Migration[6.0]
  def change
    add_index :appointment_slots, %i[doctor_id date_and_time], unique: true
  end
end
