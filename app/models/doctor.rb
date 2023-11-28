# frozen_string_literal: true

class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy

  validates :first_name, :last_name, presence: true
end
