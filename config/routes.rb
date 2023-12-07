# frozen_string_literal: true

Rails.application.routes.draw do
  root 'patients#index'

  resources :patients, only: %i[index]
  resources :appointments, only: %i[new create]
  resources :appointment_slots, only: %i[index]
end
