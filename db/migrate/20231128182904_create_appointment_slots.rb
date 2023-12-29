# frozen_string_literal: true

class CreateAppointmentSlots < ActiveRecord::Migration[7.1]
  def change
    create_table :appointment_slots do |t|
      t.datetime :date_and_time, null: false
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
