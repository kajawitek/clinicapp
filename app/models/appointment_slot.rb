# frozen_string_literal: true

class AppointmentSlot < ApplicationRecord
  belongs_to :doctor
  has_one :appointment, dependent: :destroy

  validates :date_and_time, presence: true
end
