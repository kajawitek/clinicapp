# frozen_string_literal: true

class AddAvailableToAppointmentSlots < ActiveRecord::Migration[7.1]
  def change
    add_column :appointment_slots, :available, :boolean, default: true
  end
end
