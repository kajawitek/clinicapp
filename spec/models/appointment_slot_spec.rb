# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AppointmentSlot do
  it 'is valid with valid attributes' do
    appointment_slot = build(:appointment_slot)
    expect(appointment_slot).to be_valid
  end

  it 'is not valid without a date_and_time' do
    appointment_slot = build(:appointment_slot, date_and_time: nil)
    expect(appointment_slot).not_to be_valid
  end

  it 'is not valid without a doctor' do
    appointment_slot = build(:appointment_slot, doctor: nil)
    expect(appointment_slot).not_to be_valid
  end

  it 'is created with true value for available' do
    appointment_slot = create(:appointment_slot)
    expect(appointment_slot.available).to be(true)
  end
end
