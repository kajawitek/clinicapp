# frozen_string_literal: true

class RemoveDoctorFromAppointment < ActiveRecord::Migration[7.1]
  def change
    remove_reference :appointments, :doctor, index: true, foreign_key: true
  end
end
