# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :appointment_slot

  validates :price, presence: true
end
