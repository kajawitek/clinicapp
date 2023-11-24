# frozen_string_literal: true

Rails.application.routes.draw do
  root 'patients#index'

  resources :patients, only: %i[index]
end
