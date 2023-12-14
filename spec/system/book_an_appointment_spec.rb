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

  it 'books appointment when valid, and return error notice when invalid with filtering a patient and a doctor' do
    create(:patient, first_name: 'John', last_name: 'Doe')
    appointment_slot = create(:appointment_slot, doctor: create(:doctor, first_name: 'Adam', last_name: 'Noe'))
    create(:appointment_slot, doctor: create(:doctor, first_name: 'Donald', last_name: 'Draper'))

    visit root_path

    click_link 'Patients'
    click_button 'Search'

    click_link 'Add appointment'
    select 'Adam Noe', from: 'q[doctor_id_eq]'
    click_button 'Search'
    within('#appointment-slots-table') do
      expect(page).to have_content('Adam Noe')
      expect(page).not_to have_content('Donald Draper')
    end

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
