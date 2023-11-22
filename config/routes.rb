# frozen_string_literal: true

Rails.application.routes.draw do
  root 'patients#index'

  resource :patients, only: :index
end
