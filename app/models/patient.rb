# frozen_string_literal: true

class Patient < ApplicationRecord
  validates :first_name, :last_name, :pesel, :gender, :date_of_birth, :city, presence: true
  validates :pesel, uniqueness: true

  def full_name
    [first_name, last_name].join(' ')
  end
end
