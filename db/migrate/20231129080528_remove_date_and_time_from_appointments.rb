# frozen_string_literal: true

class RemoveDateAndTimeFromAppointments < ActiveRecord::Migration[7.1]
  def change
    remove_column :appointments, :date_and_time, :datetime
  end
end
