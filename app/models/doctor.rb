# frozen_string_literal: true

class Doctor < ApplicationRecord
  validates :first_name, :last_name, presence: true
end
