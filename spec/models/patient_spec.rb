# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Patient do
  it 'is valid with valid attributes' do
    patient = build(:patient)
    expect(patient).to be_valid
  end

  it 'is not valid without a first_name' do
    patient = build(:patient, first_name: nil)
    expect(patient).not_to be_valid
  end

  it 'is not valid without a last_name' do
    patient = build(:patient, last_name: nil)
    expect(patient).not_to be_valid
  end

  it 'is not valid without a pesel' do
    patient = build(:patient, pesel: nil)
    expect(patient).not_to be_valid
  end

  it 'is not valid without a gender' do
    patient = build(:patient, gender: nil)
    expect(patient).not_to be_valid
  end

  it 'is not valid without a date_of_birth' do
    patient = build(:patient, date_of_birth: nil)
    expect(patient).not_to be_valid
  end

  it 'is not valid without a city' do
    patient = build(:patient, city: nil)
    expect(patient).not_to be_valid
  end

  it 'is not valid with a duplicate pesel' do
    patient = create(:patient)
    patient2 = build(:patient, pesel: patient.pesel)
    expect(patient2).not_to be_valid
  end
end
