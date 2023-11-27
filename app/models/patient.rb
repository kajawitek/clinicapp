# frozen_string_literal: true

class Patient < ApplicationRecord
  validates :first_name, :last_name, :pesel, :gender, :date_of_birth, :city, presence: true
  validates :pesel, uniqueness: true

  enum gender: {
    male: 'male',
    female: 'female'
  }

  def self.ransackable_attributes(_auth_object = nil)
    %w[last_name date_of_birth gender created_at]
  end
end
