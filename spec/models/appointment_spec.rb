# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appointment do
  it 'is valid with valid attributes' do
    appointment = build(:appointment)
    expect(appointment).to be_valid
  end

  it 'is not valid without a price' do
    appointment = build(:appointment, price: nil)
    expect(appointment).not_to be_valid
  end

  it 'is not valid without a patient' do
    appointment = build(:appointment, patient: nil)
    expect(appointment).not_to be_valid
  end

  it 'is not valid without an appointment_slot' do
    appointment = build(:appointment, appointment_slot: nil)
    expect(appointment).not_to be_valid
  end
end
