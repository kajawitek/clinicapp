# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appointment do
  it 'is valid with valid attributes' do
    appointment = build(:appointment)
    expect(appointment).to be_valid
  end

  it 'is not valid without a date_and_time' do
    appointment = build(:appointment, date_and_time: nil)
    expect(appointment).not_to be_valid
  end

  it 'is not valid without a price' do
    appointment = build(:appointment, price: nil)
    expect(appointment).not_to be_valid
  end

  it 'is not valid without a patient' do
    appointment = build(:appointment, patient: nil)
    expect(appointment).not_to be_valid
  end

  it 'is not valid without a doctor' do
    appointment = build(:appointment, doctor: nil)
    expect(appointment).not_to be_valid
  end
end
