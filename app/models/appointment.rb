# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates :date_and_time, :price, presence: true
end
