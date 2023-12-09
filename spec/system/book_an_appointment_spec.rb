# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Booking an appointment' do
  it 'books appointment when valid, and return error notice when invalid' do
    create(:patient)
    appointment_slot = create(:appointment_slot)

    visit root_path

    click_link 'Patients'
    click_link 'Add appointment'
    click_link 'Book appointment'
    expect(page).to have_content(appointment_slot.doctor.full_name)
    expect(page).to have_content(appointment_slot.date_and_time)

    click_button 'Create Appointment'
    expect(page).to have_content('Appointment not created!')
    expect(page).to have_content("Pricecan't be blank")

    fill_in 'appointment_price', with: 12
    click_button 'Create Appointment'
    expect(page).to have_content('Appointment created successfully!')
  end
end
