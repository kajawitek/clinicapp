# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Viewing patient list' do
  it 'lists 10 patients per page' do
    create(:patient, last_name: 'Patient no 1')
    create_list(:patient, 8)
    create(:patient, last_name: 'Patient no 10')
    create(:patient, last_name: 'Patient no 11')

    visit root_path

    expect(Patient.count).to eq(11)
    expect(page).to have_content('Patient no 1')
    expect(page).to have_content('Patient no 10')
    expect(page).not_to have_content('Patient no 11')

    click_link 'Next'

    expect(page).to have_content('Patient no 11')
  end

  it 'sorts by last_name and date_of birth' do
    create(:patient, last_name: 'Kpatient', date_of_birth: '1992-01-01')
    create(:patient, last_name: 'Apatient', date_of_birth: '1991-01-01')
    create(:patient, last_name: 'Zpatient', date_of_birth: '1990-01-01')

    visit root_path

    click_link 'Last Name'

    table = find('table')

    first_row = table.all('tr')[1]
    second_row = table.all('tr')[2]
    third_row = table.all('tr')[3]

    expect(first_row).to have_text('Apatient')
    expect(second_row).to have_text('Kpatient')
    expect(third_row).to have_text('Zpatient')

    click_link 'Date Of Birth'

    table = find('table')

    first_row = table.all('tr')[1]
    second_row = table.all('tr')[2]
    third_row = table.all('tr')[3]

    expect(first_row).to have_text('1990-01-01')
    expect(second_row).to have_text('1991-01-01')
    expect(third_row).to have_text('1992-01-01')
  end

  it 'filter by last_name and gender' do
    create(:patient, last_name: 'Kpatient', gender: 'male')
    create(:patient, last_name: 'Apatient', gender: 'male')
    create(:patient, last_name: 'Zpatient', gender: 'female')

    visit root_path

    fill_in 'q_last_name_cont', with: 'patient'
    click_button 'Search'

    expect(page).to have_content('Kpatient')
    expect(page).to have_content('Apatient')
    expect(page).to have_content('Zpatient')

    fill_in 'q_last_name_cont', with: 'Apatient'
    click_button 'Search'

    expect(page).not_to have_content('Kpatient')
    expect(page).to have_content('Apatient')
    expect(page).not_to have_content('Zpatient')

    fill_in 'q_last_name_cont', with: ''

    select 'male', from: 'q[gender_eq]'
    click_button 'Search'

    expect(page).to have_content('Kpatient')
    expect(page).to have_content('Apatient')
    expect(page).not_to have_content('Zpatient')

    select 'female', from: 'q[gender_eq]'
    click_button 'Search'

    expect(page).not_to have_content('Kpatient')
    expect(page).not_to have_content('Apatient')
    expect(page).to have_content('Zpatient')
  end
end
