# frozen_string_literal: true

class Doctor < ApplicationRecord
  has_many :appointment_slots, dependent: :destroy

  validates :first_name, :last_name, presence: true

  def full_name
    [first_name, last_name].join(' ')
  end

  def self.doctors_for_select
    joins(:appointment_slots).distinct.map { |doctor| [doctor.full_name, doctor.id] }
  end
end
