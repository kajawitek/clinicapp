# frozen_string_literal: true

class AppointmentSlot < ApplicationRecord
  belongs_to :doctor
  has_one :appointment, dependent: :destroy

  validates :date_and_time, presence: true
  validates :available, inclusion: { in: [true, false] }

  def self.ransackable_attributes(_auth_object = nil)
    %w[doctor_id date_and_time year]
  end
end
