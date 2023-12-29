# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Doctor do
  it 'is valid with valid attributes' do
    doctor = build(:doctor)
    expect(doctor).to be_valid
  end

  it 'is not valid without a first_name' do
    doctor = build(:doctor, first_name: nil)
    expect(doctor).not_to be_valid
  end

  it 'is not valid without a last_name' do
    doctor = build(:doctor, last_name: nil)
    expect(doctor).not_to be_valid
  end
end
